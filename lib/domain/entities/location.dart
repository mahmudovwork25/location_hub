import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

/// Domain entity representing a geographic location snapshot
@freezed
class Location with _$Location {
  const factory Location({
    required double latitude,
    required double longitude,
    required double speed,
    required double accuracy,
    required DateTime timestamp,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
