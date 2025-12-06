// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackingStatusImpl _$$TrackingStatusImplFromJson(Map<String, dynamic> json) =>
    _$TrackingStatusImpl(
      isRunning: json['isRunning'] as bool,
      isConnected: json['isConnected'] as bool,
      connectionState: json['connectionState'] as String,
      locationsSent: (json['locationsSent'] as num).toInt(),
      locationsCached: (json['locationsCached'] as num).toInt(),
      currentLocation: json['currentLocation'] == null
          ? null
          : Location.fromJson(json['currentLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TrackingStatusImplToJson(
  _$TrackingStatusImpl instance,
) => <String, dynamic>{
  'isRunning': instance.isRunning,
  'isConnected': instance.isConnected,
  'connectionState': instance.connectionState,
  'locationsSent': instance.locationsSent,
  'locationsCached': instance.locationsCached,
  'currentLocation': instance.currentLocation,
};
