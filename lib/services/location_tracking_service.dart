import 'dart:async';
import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_hub/services/signalr_service.dart';
import 'package:location_hub/services/storage_service.dart';
import 'package:location_hub/utils/date_formatter.dart';

// Required for notification update inside the isolate
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  print('\n🟢 [BACKGROUND] ====== BACKGROUND SERVICE STARTED ======');
  print('[BACKGROUND] Initializing plugins...');
  DartPluginRegistrant.ensureInitialized();
  print('✅ [BACKGROUND] Plugins initialized');

  // Initialize Services
  final storageService = StorageService();
  await storageService.initialize();

  final signalRService = SignalRService(serverUrl: "http://10.100.104.128:5084/hubs/location");

  int locationsSent = 0;
  int locationsCached = storageService.cachedCount;

  // Send initial status to UI
  service.invoke('update', {
    "isConnected": false,
    "connectionState": "Connecting...",
    "locationsSent": locationsSent,
    "locationsCached": locationsCached,
    "isRunning": true,
    "lat": 0.0,
    "lng": 0.0,
  });

  // Listen for status requests from UI
  service.on('requestStatus').listen((event) {
    print('📡 [BACKGROUND] Status request received from UI');
    service.invoke('update', {
      "lat": 0.0, // Will be updated on next tick
      "lng": 0.0,
      "isConnected": signalRService.isConnected,
      "connectionState": signalRService.isConnected ? "Connected" : "Disconnected",
      "locationsSent": locationsSent,
      "locationsCached": locationsCached,
      "isRunning": true,
    });
  });

  service.on('stopService').listen((event) {
    print('🛑 [BACKGROUND] Stop service command received');
    service.invoke('update', {"isRunning": false, "isConnected": false, "connectionState": "Stopped", "lat": 0.0, "lng": 0.0});
    service.stopSelf();
    print('✅ [BACKGROUND] Service stopped');
  });

  // Function to sync cached locations
  Future<void> syncCachedLocations() async {
    if (!storageService.hasCachedLocations) return;

    print('🔄 [SYNC] Syncing ${storageService.cachedCount} cached locations...');

    final List<dynamic> cachedData = storageService.allCachedLocations;

    for (int i = 0; i < cachedData.length; i++) {
      try {
        final locationData = cachedData[i] as Map<String, dynamic>;
        final payload = {
          "userId": 2,
          "locations": [locationData],
        };

        print('[SYNC] Sending cached location ${i + 1}/${cachedData.length}');
        await signalRService.sendLocation(payload);
        locationsSent++;

        // Remove from cache after successful send
        await storageService.removeFirstCached();
        locationsCached = storageService.cachedCount;

        print('✅ [SYNC] Cached location sent and removed');
      } catch (e) {
        print('❌ [SYNC] Failed to send cached location: $e');
        break; // Stop syncing if one fails
      }
    }

    if (!storageService.hasCachedLocations) {
      print('✅ [SYNC] All cached locations synced!');
    }
  }

  // Start Loop
  print('⏰ [BACKGROUND] Starting periodic timer (10 seconds interval)...');
  int loopCount = 0;
  Timer.periodic(const Duration(seconds: 10), (timer) async {
    loopCount++;
    print('\n🔄 [LOOP #$loopCount] ====== Timer tick at ${DateTime.now()} ======');

    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        try {
          // A. Get Geo Location
          print('📍 [LOCATION] Requesting current position...');
          Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

          // B. Construct Payload
          final timestamp = DateFormatter.getFormattedTime();
          final locationData = {
            "timestamp": timestamp,
            "latitude": position.latitude.toString(),
            "longitude": position.longitude.toString(),
            "speed": position.speed.toString(),
            "accuracy": position.accuracy.toString(),
          };

          final payload = {
            "userId": 2,
            "locations": [locationData],
          };

          // C. Send to Server OR Cache if offline
          await signalRService.ensureConnection();

          if (signalRService.isConnected) {
            // First, sync any cached locations
            await syncCachedLocations();

            // Then send current location
            try {
              await signalRService.sendLocation(payload);
              locationsSent++;

              // Update Notification
              final timeOnly = DateFormatter.getTimeOnly();
              flutterLocalNotificationsPlugin.show(
                888,
                'Location Tracker',
                'Sent $locationsSent locations | Last: $timeOnly',
                const NotificationDetails(
                  android: AndroidNotificationDetails(
                    'delivery_tracking_channel',
                    'Delivery Tracking Service',
                    icon: 'ic_bg_service_small',
                    ongoing: true,
                  ),
                ),
              );
            } catch (e) {
              print('❌ [SIGNALR] Send failed: $e - Caching location');
              await storageService.cacheLocation(locationData);
              locationsCached = storageService.cachedCount;
            }
          } else {
            print('❌ [SIGNALR] Not connected! Caching location offline...');
            await storageService.cacheLocation(locationData);
            locationsCached = storageService.cachedCount;

            // Update notification with cached status
            final timeOnly = DateFormatter.getTimeOnly();
            flutterLocalNotificationsPlugin.show(
              888,
              'Location Tracker',
              'Cached $locationsCached locations (offline) | $timeOnly',
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

          // Send comprehensive data to UI
          service.invoke('update', {
            "lat": position.latitude,
            "lng": position.longitude,
            "speed": position.speed,
            "accuracy": position.accuracy,
            "time": timestamp,
            "isConnected": signalRService.isConnected,
            "connectionState": signalRService.isConnected ? "Connected" : "Disconnected",
            "locationsSent": locationsSent,
            "locationsCached": locationsCached,
            "isRunning": true,
          });
        } catch (e) {
          print("❌ [ERROR] Error in background loop: $e");
        }
      }
    }
  });
}
