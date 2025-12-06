import 'dart:async';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:injectable/injectable.dart';
import 'package:location_hub/domain/entities/location.dart';
import 'package:location_hub/domain/entities/tracking_status.dart';
import 'package:location_hub/domain/repositories/tracking_repository.dart';

/// Implementation of TrackingRepository
///
/// Manages the background service lifecycle and streams tracking status updates.
@Singleton(as: TrackingRepository)
class TrackingRepositoryImpl implements TrackingRepository {
  final FlutterBackgroundService _backgroundService;
  final StreamController<TrackingStatus> _statusController;

  TrackingRepositoryImpl(this._backgroundService)
    : _statusController = StreamController<TrackingStatus>.broadcast() {
    _listenToServiceUpdates();
  }

  void _listenToServiceUpdates() {
    _backgroundService.on('update').listen((event) {
      if (event == null) return;

      try {
        final data = Map<String, dynamic>.from(event);

        Location? currentLocation;
        if (data.containsKey('lat') && data.containsKey('lng')) {
          final lat = data['lat'] as double?;
          final lng = data['lng'] as double?;

          if (lat != null && lng != null && lat != 0.0 && lng != 0.0) {
            currentLocation = Location(
              latitude: lat,
              longitude: lng,
              speed: (data['speed'] as double?) ?? 0.0,
              accuracy: (data['accuracy'] as double?) ?? 0.0,
              timestamp: data.containsKey('time')
                  ? DateTime.parse(data['time'] as String)
                  : DateTime.now(),
            );
          }
        }

        final status = TrackingStatus(
          isRunning: data['isRunning'] as bool? ?? false,
          isConnected: data['isConnected'] as bool? ?? false,
          connectionState: data['connectionState'] as String? ?? 'Unknown',
          locationsSent: data['locationsSent'] as int? ?? 0,
          locationsCached: data['locationsCached'] as int? ?? 0,
          currentLocation: currentLocation,
        );

        _statusController.add(status);
        print('📊 [TRACKING_REPO] Status update: ${status.connectionState}');
      } catch (e) {
        print('❌ [TRACKING_REPO] Error parsing status update: $e');
      }
    });
  }

  @override
  Future<void> startTracking() async {
    print('▶️ [TRACKING_REPO] Starting tracking service');
    await _backgroundService.startService();
  }

  @override
  Future<void> stopTracking() async {
    print('⏹️ [TRACKING_REPO] Stopping tracking service');
    _backgroundService.invoke('stopService');
  }

  @override
  Stream<TrackingStatus> getTrackingStatusStream() {
    return _statusController.stream;
  }

  @override
  Future<bool> isTracking() async {
    return await _backgroundService.isRunning();
  }

  @override
  Future<void> requestStatusUpdate() async {
    print('📡 [TRACKING_REPO] Requesting status update');
    _backgroundService.invoke('requestStatus');
  }

  void dispose() {
    _statusController.close();
  }
}
