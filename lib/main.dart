import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the background service
  await initializeService();

  runApp(const DeliveryTrackerApp());
}

// 1. Background Service Configuration
Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  // Notification channel for Android (required for foreground service)
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'delivery_tracking_channel', // id
    'Delivery Tracking Service', // title
    description: 'Running in background to track location',
    importance: Importance.low,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  if (Platform.isIOS || Platform.isAndroid) {
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
  }

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart, // The function that runs in the background
      autoStart: false, // Wait for user to click 'Start'
      isForegroundMode: true,
      notificationChannelId: 'delivery_tracking_channel',
      initialNotificationTitle: 'Delivery Tracker',
      initialNotificationContent: 'Initializing...',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: false,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
}

// iOS background handler (must be global/static)
@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  return true;
}

// Required for notification update inside the isolate
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

// 2. The Background Logic (Runs in a separate Isolate)
@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();

  // 1. Setup SignalR
  final hubConnection = HubConnectionBuilder()
      .withUrl("http://10.100.104.128:5084/hubs/location")
      .withAutomaticReconnect()
      .build();

  Future<void> ensureConnection() async {
    if (hubConnection.state != HubConnectionState.Connected) {
      try {
        await hubConnection.start();
        print("SignalR Connected ID: ${hubConnection.connectionId}");
      } catch (e) {
        print("SignalR Connection Error: $e");
      }
    }
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  // 2. Helper to format date exactly like: 2025-12-04 15:21:21.706+05
  String getFormattedTime() {
    final now = DateTime.now();
    // Format the main part
    final baseFormat = DateFormat('yyyy-MM-dd HH:mm:ss.SSS').format(now);

    // Get timezone offset (e.g., 5.0)
    final offset = now.timeZoneOffset.inHours;
    // Format offset to "+05" or "-05"
    final offsetString = offset >= 0
        ? "+${offset.toString().padLeft(2, '0')}"
        : "-${offset.abs().toString().padLeft(2, '0')}";

    return "$baseFormat$offsetString";
  }

  // 3. Start Loop (Set to 5 minutes for production)
  Timer.periodic(const Duration(minutes: 5), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        try {
          // A. Get Geo Location
          Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );

          // B. Construct Payload
          // Note: userId is Integer (2), but lat/long/speed are Strings per your JSON request.
          final locationData = {
            "timestamp": getFormattedTime(),
            "latitude": position.latitude.toString(),
            "longitude": position.longitude.toString(),
            "speed": position.speed.toString(),
            "accuracy": position.accuracy.toString()
          };

          final payload = {
            "userId": 2, // Static ID
            "locations": [locationData] // List containing the object
          };

          // C. Send to Server
          await ensureConnection();

          if (hubConnection.state == HubConnectionState.Connected) {
            print("Sending: $payload");

            // "SendLocations" is the C# Method Name
            // args expects a List of arguments. Since your method takes 1 object,
            // we wrap 'payload' in a list: [payload]
            await hubConnection.invoke("SendLocations", args: [payload]);

            // Update Notification
            flutterLocalNotificationsPlugin.show(
              888,
              'Delivery Tracker',
              'Sent: ${getFormattedTime()}',
              const NotificationDetails(
                android: AndroidNotificationDetails(
                  'delivery_tracking_channel',
                  'Delivery Tracking Service',
                  icon: 'ic_bg_service_small',
                  ongoing: true,
                ),
              ),
            );
          }

          // Send data to UI
          service.invoke('update', {
            "lat": position.latitude,
            "lng": position.longitude,
            "time": getFormattedTime(),
          });

        } catch (e) {
          print("Error in background loop: $e");
        }
      }
    }
  });
}


class DeliveryTrackerApp extends StatefulWidget {
  const DeliveryTrackerApp({super.key});

  @override
  State<DeliveryTrackerApp> createState() => _DeliveryTrackerAppState();
}

class _DeliveryTrackerAppState extends State<DeliveryTrackerApp> {
  String status = "Stopped";
  String lastLocation = "No data yet";
  bool isRunning = false;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    // Request location permissions
    await Permission.location.request();
    await Permission.locationAlways.request(); // Crucial for background
    await Permission.notification.request();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Delivery Tracker")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                  Icons.delivery_dining,
                  size: 100,
                  color: isRunning ? Colors.green : Colors.grey
              ),
              const SizedBox(height: 20),
              Text("Status: $status", style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              Text(lastLocation, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 40),
              StreamBuilder<Map<String, dynamic>?>(
                stream: FlutterBackgroundService().on('update'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Waiting for background update...");
                  }
                  final data = snapshot.data!;
                  return Text(
                    "Live: ${data['lat']}, ${data['lng']}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  );
                },
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final service = FlutterBackgroundService();
                      var isRunning = await service.isRunning();
                      if (isRunning) {
                        service.invoke("stopService");
                      } else {
                        service.startService();
                      }
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15)
                    ),
                    child: const Text("Toggle Service", style: TextStyle(color: Colors.white)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
