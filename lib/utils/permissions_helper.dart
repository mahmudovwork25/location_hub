import 'package:permission_handler/permission_handler.dart';

/// Utility class for handling app permissions
class PermissionsHelper {
  /// Request all required permissions for the app
  static Future<void> checkAndRequestPermissions() async {
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
}
