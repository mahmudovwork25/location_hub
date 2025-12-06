import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location_hub/domain/entities/location.dart';

part 'location_tracking_state.freezed.dart';

/// States for LocationTracking BLoC
@freezed
class LocationTrackingState with _$LocationTrackingState {
  /// Initial state
  const factory LocationTrackingState.initial() = _Initial;

  /// Loading state (permissions, service initialization)
  const factory LocationTrackingState.loading() = _Loading;

  /// Tracking is active and locations are being sent
  const factory LocationTrackingState.active({
    required bool isConnected,
    required String connectionState,
    required int locationsSent,
    required int locationsCached,
    Location? currentLocation,
  }) = _Active;

  /// Tracking is stopped
  const factory LocationTrackingState.stopped({
    @Default(0) int locationsSent,
    @Default(0) int locationsCached,
  }) = _Stopped;

  /// Error state
  const factory LocationTrackingState.error(String message) = _Error;
}
