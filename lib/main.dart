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
  print('🚀 [MAIN] App starting...');
  WidgetsFlutterBinding.ensureInitialized();
  print('✅ [MAIN] Flutter binding initialized');

  // Initialize the background service
  print('⚙️ [MAIN] Initializing background service...');
  await initializeService();
  print('✅ [MAIN] Background service initialized');

  print('🎨 [MAIN] Starting app UI...');
  runApp(const DeliveryTrackerApp());
}

// 1. Background Service Configuration
Future<void> initializeService() async {
  print('📱 [SERVICE] Initializing FlutterBackgroundService...');
  final service = FlutterBackgroundService();

  // Notification channel for Android (required for foreground service)
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'delivery_tracking_channel', // id
    'Delivery Tracking Service', // title
    description: 'Running in background to track location',
    importance: Importance.low,
  );
  print('🔔 [SERVICE] Created notification channel: delivery_tracking_channel');

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  if (Platform.isIOS || Platform.isAndroid) {
    print('📱 [SERVICE] Platform: ${Platform.isAndroid ? "Android" : "iOS"}');
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
    print('✅ [SERVICE] Notification channel registered');
  }

  print('⚙️ [SERVICE] Configuring service...');
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
  print('✅ [SERVICE] Service configured successfully');
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
  print('\n🟢 [BACKGROUND] ====== BACKGROUND SERVICE STARTED ======');
  print('[BACKGROUND] Initializing plugins...');
  DartPluginRegistrant.ensureInitialized();
  print('✅ [BACKGROUND] Plugins initialized');

  // 1. Setup SignalR
  print('🔌 [SIGNALR] Setting up SignalR connection...');
  print('[SIGNALR] Server URL: http://10.100.104.128:5084/hubs/location');
  final hubConnection = HubConnectionBuilder()
      .withUrl("http://10.100.104.128:5084/hubs/location")
      .withAutomaticReconnect()
      .build();
  print('✅ [SIGNALR] HubConnection built with auto-reconnect');

  Future<void> ensureConnection() async {
    print('[SIGNALR] Checking connection state: ${hubConnection.state}');
    if (hubConnection.state != HubConnectionState.Connected) {
      try {
        print('⏳ [SIGNALR] Attempting to connect...');
        await hubConnection.start();
        print(
          "✅ [SIGNALR] Connected! Connection ID: ${hubConnection.connectionId}",
        );
      } catch (e) {
        print("❌ [SIGNALR] Connection Error: $e");
      }
    } else {
      print(
        '✅ [SIGNALR] Already connected (ID: ${hubConnection.connectionId})',
      );
    }
  }

  service.on('stopService').listen((event) {
    print('🛑 [BACKGROUND] Stop service command received');
    service.stopSelf();
    print('✅ [BACKGROUND] Service stopped');
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
  print('⏰ [BACKGROUND] Starting periodic timer (5 minutes interval)...');
  int loopCount = 0;
  Timer.periodic(const Duration(minutes: 5), (timer) async {
    loopCount++;
    print(
      '\n🔄 [LOOP #$loopCount] ====== Timer tick at ${DateTime.now()} ======',
    );
    if (service is AndroidServiceInstance) {
      print('[LOOP #$loopCount] Running on Android');
      if (await service.isForegroundService()) {
        print('[LOOP #$loopCount] Service is in foreground mode');
        try {
          // A. Get Geo Location
          print('📍 [LOCATION] Requesting current position...');
          Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );
          print(
            '✅ [LOCATION] Got position: Lat=${position.latitude}, Lng=${position.longitude}, Speed=${position.speed}m/s, Accuracy=${position.accuracy}m',
          );

          // B. Construct Payload
          print('📦 [PAYLOAD] Constructing data payload...');
          final timestamp = getFormattedTime();
          final locationData = {
            "timestamp": timestamp,
            "latitude": position.latitude.toString(),
            "longitude": position.longitude.toString(),
            "speed": position.speed.toString(),
            "accuracy": position.accuracy.toString(),
          };
          print('[PAYLOAD] Location data: $locationData');

          final payload = {
            "userId": 2, // Static ID
            "locations": [locationData], // List containing the object
          };
          print('📦 [PAYLOAD] Complete payload ready for userId: 2');

          // C. Send to Server
          print('🔌 [SIGNALR] Ensuring connection before send...');
          await ensureConnection();

          if (hubConnection.state == HubConnectionState.Connected) {
            print('📤 [SIGNALR] Sending payload to server...');
            print('[SIGNALR] Payload: $payload');

            // "SendLocations" is the C# Method Name
            // args expects a List of arguments. Since your method takes 1 object,
            // we wrap 'payload' in a list: [payload]
            await hubConnection.invoke("SendLocations", args: [payload]);
            print('✅ [SIGNALR] Data sent successfully!');

            // Update Notification
            print('🔔 [NOTIFICATION] Updating notification...');
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
            print('✅ [NOTIFICATION] Notification displayed');
          } else {
            print(
              '❌ [SIGNALR] Cannot send - not connected! State: ${hubConnection.state}',
            );
          }

          // Send data to UI
          print('📱 [UI] Sending update to UI...');
          service.invoke('update', {
            "lat": position.latitude,
            "lng": position.longitude,
            "time": getFormattedTime(),
          });
          print('✅ [UI] UI updated');
        } catch (e) {
          print("❌ [ERROR] Error in background loop: $e");
          print('[ERROR] Stack trace: ${StackTrace.current}');
        }
      } else {
        print('⚠️ [LOOP #$loopCount] Service is not in foreground mode');
      }
    } else {
      print('⚠️ [LOOP #$loopCount] Not running on Android');
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
    print('\n🔐 [PERMISSIONS] Checking permissions...');

    // Request location permissions
    print('[PERMISSIONS] Requesting location permission...');
    final locationStatus = await Permission.location.request();
    print('[PERMISSIONS] Location permission: $locationStatus');

    print('[PERMISSIONS] Requesting background location permission...');
    final backgroundStatus = await Permission.locationAlways.request();
    print('[PERMISSIONS] Background location permission: $backgroundStatus');

    print('[PERMISSIONS] Requesting notification permission...');
    final notificationStatus = await Permission.notification.request();
    print('[PERMISSIONS] Notification permission: $notificationStatus');

    print('✅ [PERMISSIONS] Permission check complete\n');
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
                color: isRunning ? Colors.green : Colors.grey,
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
                      print('\n🔘 [UI] Toggle button pressed');
                      final service = FlutterBackgroundService();
                      var isRunning = await service.isRunning();
                      print('[UI] Service running status: $isRunning');

                      if (isRunning) {
                        print('[UI] Stopping service...');
                        service.invoke("stopService");
                        print('✅ [UI] Stop command sent');
                      } else {
                        print('[UI] Starting service...');
                        service.startService();
                        print('✅ [UI] Service started');
                      }
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      "Toggle Service",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
