import 'dart:io';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:location_hub/services/location_tracking_service.dart';

/// Service for configuring and initializing the background service
class BackgroundServiceConfig {
  /// Initialize the background service with notification channel
  static Future<void> initialize() async {
    print('📱 [SERVICE] Initializing FlutterBackgroundService...');
    final service = FlutterBackgroundService();

    // Notification channel for Android
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'delivery_tracking_channel',
      'Delivery Tracking Service',
      description: 'Running in background to track location',
      importance: Importance.low,
    );
    print('🔔 [SERVICE] Created notification channel: delivery_tracking_channel');

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    if (Platform.isIOS || Platform.isAndroid) {
      print('📱 [SERVICE] Platform: ${Platform.isAndroid ? "Android" : "iOS"}');
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
      print('✅ [SERVICE] Notification channel registered');
    }

    print('⚙️ [SERVICE] Configuring service...');
    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: false,
        isForegroundMode: true,
        notificationChannelId: 'delivery_tracking_channel',
        initialNotificationTitle: 'Location Tracker',
        initialNotificationContent: 'Initializing...',
        foregroundServiceNotificationId: 888,
      ),
      iosConfiguration: IosConfiguration(autoStart: false, onForeground: onStart, onBackground: onIosBackground),
    );
    print('✅ [SERVICE] Service configured successfully');
  }

  /// iOS background handler
  @pragma('vm:entry-point')
  static Future<bool> onIosBackground(ServiceInstance service) async {
    return true;
  }
}
