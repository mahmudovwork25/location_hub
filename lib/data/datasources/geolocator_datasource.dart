import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:location_hub/data/models/location_model.dart';

/// GPS data source using Geolocator package
@singleton
class GeolocatorDataSource {
  StreamController<LocationModel>? _locationController;

  /// Get stream of filtered location updates
  Stream<LocationModel> getLocationStream() {
    _locationController ??= StreamController<LocationModel>.broadcast();

    // Start listening to position stream
    _startLocationUpdates();

    return _locationController!.stream;
  }

  void _startLocationUpdates() {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 0,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings).listen(
      (Position position) {
        // Filter by accuracy (ignore if > 15m)
        if (position.accuracy > 15.0) {
          print(
            '⚠️ [GPS_DS] Ignored: Accuracy too low (${position.accuracy}m)',
          );
          return;
        }

        // Filter by speed (ignore if not moving)
        if (position.speed < 0.5) {
          print('⚠️ [GPS_DS] Ignored: Not moving (${position.speed} m/s)');
          return;
        }

        // Create location model
        final location = LocationModel(
          latitude: position.latitude,
          longitude: position.longitude,
          speed: position.speed,
          accuracy: position.accuracy,
          timestamp: DateTime.now(),
        );

        print(
          '✅ [GPS_DS] Valid location: ${location.latitude}, ${location.longitude}',
        );
        _locationController?.add(location);
      },
      onError: (error) {
        print('❌ [GPS_DS] Error: $error');
      },
    );
  }

  /// Get current position once
  Future<LocationModel> getCurrentPosition() async {
    print('📍 [GPS_DS] Requesting current position...');

    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
        timeLimit: const Duration(seconds: 5),
      );

      final location = LocationModel(
        latitude: position.latitude,
        longitude: position.longitude,
        speed: position.speed,
        accuracy: position.accuracy,
        timestamp: DateTime.now(),
      );

      print(
        '✅ [GPS_DS] Position obtained: ${location.latitude}, ${location.longitude}',
      );
      return location;
    } catch (e) {
      print('❌ [GPS_DS] Failed to get position: $e');
      rethrow;
    }
  }

  /// Dispose resources
  void dispose() {
    _locationController?.close();
  }
}
