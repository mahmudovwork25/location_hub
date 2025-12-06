import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location_hub/domain/entities/location.dart';

part 'tracking_status.freezed.dart';
part 'tracking_status.g.dart';

/// Domain entity representing the current state of location tracking
@freezed
class TrackingStatus with _$TrackingStatus {
  const factory TrackingStatus({
    required bool isRunning,
    required bool isConnected,
    required String connectionState,
    required int locationsSent,
    required int locationsCached,
    Location? currentLocation,
  }) = _TrackingStatus;

  factory TrackingStatus.fromJson(Map<String, dynamic> json) =>
      _$TrackingStatusFromJson(json);

  factory TrackingStatus.initial() => const TrackingStatus(
    isRunning: false,
    isConnected: false,
    connectionState: 'Stopped',
    locationsSent: 0,
    locationsCached: 0,
    currentLocation: null,
  );
}
