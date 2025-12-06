import 'package:location_hub/domain/entities/tracking_status.dart';

/// Repository interface for tracking service operations
///
/// This abstract class defines the contract for controlling
/// the background location tracking service.
abstract class TrackingRepository {
  /// Start the background location tracking service
  Future<void> startTracking();

  /// Stop the background location tracking service
  Future<void> stopTracking();

  /// Get a stream of tracking status updates
  Stream<TrackingStatus> getTrackingStatusStream();

  /// Check if tracking is currently active
  Future<bool> isTracking();

  /// Request an immediate status update
  Future<void> requestStatusUpdate();
}
