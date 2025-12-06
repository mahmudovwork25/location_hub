import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location_hub/domain/entities/location.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

/// Data model for Location entity with JSON serialization
///
/// This extends the domain Location entity and adds serialization
/// capabilities for network and local storage operations.
@freezed
class LocationModel with _$LocationModel {
  const LocationModel._();

  const factory LocationModel({
    required double latitude,
    required double longitude,
    required double speed,
    required double accuracy,
    required DateTime timestamp,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  /// Convert from domain entity
  factory LocationModel.fromEntity(Location location) {
    return LocationModel(
      latitude: location.latitude,
      longitude: location.longitude,
      speed: location.speed,
      accuracy: location.accuracy,
      timestamp: location.timestamp,
    );
  }

  /// Convert to domain entity
  Location toEntity() {
    return Location(
      latitude: latitude,
      longitude: longitude,
      speed: speed,
      accuracy: accuracy,
      timestamp: timestamp,
    );
  }

  /// Format for SignalR payload
  Map<String, String> toSignalRPayload() {
    return {
      'timestamp': timestamp.toIso8601String(),
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'speed': speed.toString(),
      'accuracy': accuracy.toString(),
    };
  }

  /// Create from SignalR-style map
  factory LocationModel.fromSignalRPayload(Map<String, dynamic> payload) {
    return LocationModel(
      latitude: double.parse(payload['latitude'] as String),
      longitude: double.parse(payload['longitude'] as String),
      speed: double.parse(payload['speed'] as String),
      accuracy: double.parse(payload['accuracy'] as String),
      timestamp: DateTime.parse(payload['timestamp'] as String),
    );
  }
}
