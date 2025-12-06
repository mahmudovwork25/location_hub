import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location_hub/domain/entities/location.dart';

part 'location_tracking_event.freezed.dart';

/// Events for LocationTracking BLoC
@freezed
class LocationTrackingEvent with _$LocationTrackingEvent {
  /// Start location tracking
  const factory LocationTrackingEvent.startTracking() = StartTracking;

  /// Stop location tracking
  const factory LocationTrackingEvent.stopTracking() = StopTracking;

  /// Location updated from GPS
  const factory LocationTrackingEvent.locationUpdated(Location location) =
      LocationUpdated;

  /// Status update received from background service
  const factory LocationTrackingEvent.statusUpdated({
    required bool isRunning,
    required bool isConnected,
    required String connectionState,
    required int locationsSent,
    required int locationsCached,
    Location? currentLocation,
  }) = StatusUpdated;

  /// Request status update from service
  const factory LocationTrackingEvent.requestStatus() = RequestStatus;

  /// Sync cached locations to server
  const factory LocationTrackingEvent.syncCachedLocations() =
      SyncCachedLocations;
}
