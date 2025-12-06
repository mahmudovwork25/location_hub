// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracking_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TrackingStatus _$TrackingStatusFromJson(Map<String, dynamic> json) {
  return _TrackingStatus.fromJson(json);
}

/// @nodoc
mixin _$TrackingStatus {
  bool get isRunning => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;
  String get connectionState => throw _privateConstructorUsedError;
  int get locationsSent => throw _privateConstructorUsedError;
  int get locationsCached => throw _privateConstructorUsedError;
  Location? get currentLocation => throw _privateConstructorUsedError;

  /// Serializes this TrackingStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrackingStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackingStatusCopyWith<TrackingStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackingStatusCopyWith<$Res> {
  factory $TrackingStatusCopyWith(
    TrackingStatus value,
    $Res Function(TrackingStatus) then,
  ) = _$TrackingStatusCopyWithImpl<$Res, TrackingStatus>;
  @useResult
  $Res call({
    bool isRunning,
    bool isConnected,
    String connectionState,
    int locationsSent,
    int locationsCached,
    Location? currentLocation,
  });

  $LocationCopyWith<$Res>? get currentLocation;
}

/// @nodoc
class _$TrackingStatusCopyWithImpl<$Res, $Val extends TrackingStatus>
    implements $TrackingStatusCopyWith<$Res> {
  _$TrackingStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackingStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRunning = null,
    Object? isConnected = null,
    Object? connectionState = null,
    Object? locationsSent = null,
    Object? locationsCached = null,
    Object? currentLocation = freezed,
  }) {
    return _then(
      _value.copyWith(
            isRunning: null == isRunning
                ? _value.isRunning
                : isRunning // ignore: cast_nullable_to_non_nullable
                      as bool,
            isConnected: null == isConnected
                ? _value.isConnected
                : isConnected // ignore: cast_nullable_to_non_nullable
                      as bool,
            connectionState: null == connectionState
                ? _value.connectionState
                : connectionState // ignore: cast_nullable_to_non_nullable
                      as String,
            locationsSent: null == locationsSent
                ? _value.locationsSent
                : locationsSent // ignore: cast_nullable_to_non_nullable
                      as int,
            locationsCached: null == locationsCached
                ? _value.locationsCached
                : locationsCached // ignore: cast_nullable_to_non_nullable
                      as int,
            currentLocation: freezed == currentLocation
                ? _value.currentLocation
                : currentLocation // ignore: cast_nullable_to_non_nullable
                      as Location?,
          )
          as $Val,
    );
  }

  /// Create a copy of TrackingStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get currentLocation {
    if (_value.currentLocation == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.currentLocation!, (value) {
      return _then(_value.copyWith(currentLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrackingStatusImplCopyWith<$Res>
    implements $TrackingStatusCopyWith<$Res> {
  factory _$$TrackingStatusImplCopyWith(
    _$TrackingStatusImpl value,
    $Res Function(_$TrackingStatusImpl) then,
  ) = __$$TrackingStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isRunning,
    bool isConnected,
    String connectionState,
    int locationsSent,
    int locationsCached,
    Location? currentLocation,
  });

  @override
  $LocationCopyWith<$Res>? get currentLocation;
}

/// @nodoc
class __$$TrackingStatusImplCopyWithImpl<$Res>
    extends _$TrackingStatusCopyWithImpl<$Res, _$TrackingStatusImpl>
    implements _$$TrackingStatusImplCopyWith<$Res> {
  __$$TrackingStatusImplCopyWithImpl(
    _$TrackingStatusImpl _value,
    $Res Function(_$TrackingStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TrackingStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRunning = null,
    Object? isConnected = null,
    Object? connectionState = null,
    Object? locationsSent = null,
    Object? locationsCached = null,
    Object? currentLocation = freezed,
  }) {
    return _then(
      _$TrackingStatusImpl(
        isRunning: null == isRunning
            ? _value.isRunning
            : isRunning // ignore: cast_nullable_to_non_nullable
                  as bool,
        isConnected: null == isConnected
            ? _value.isConnected
            : isConnected // ignore: cast_nullable_to_non_nullable
                  as bool,
        connectionState: null == connectionState
            ? _value.connectionState
            : connectionState // ignore: cast_nullable_to_non_nullable
                  as String,
        locationsSent: null == locationsSent
            ? _value.locationsSent
            : locationsSent // ignore: cast_nullable_to_non_nullable
                  as int,
        locationsCached: null == locationsCached
            ? _value.locationsCached
            : locationsCached // ignore: cast_nullable_to_non_nullable
                  as int,
        currentLocation: freezed == currentLocation
            ? _value.currentLocation
            : currentLocation // ignore: cast_nullable_to_non_nullable
                  as Location?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackingStatusImpl implements _TrackingStatus {
  const _$TrackingStatusImpl({
    required this.isRunning,
    required this.isConnected,
    required this.connectionState,
    required this.locationsSent,
    required this.locationsCached,
    this.currentLocation,
  });

  factory _$TrackingStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackingStatusImplFromJson(json);

  @override
  final bool isRunning;
  @override
  final bool isConnected;
  @override
  final String connectionState;
  @override
  final int locationsSent;
  @override
  final int locationsCached;
  @override
  final Location? currentLocation;

  @override
  String toString() {
    return 'TrackingStatus(isRunning: $isRunning, isConnected: $isConnected, connectionState: $connectionState, locationsSent: $locationsSent, locationsCached: $locationsCached, currentLocation: $currentLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackingStatusImpl &&
            (identical(other.isRunning, isRunning) ||
                other.isRunning == isRunning) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.connectionState, connectionState) ||
                other.connectionState == connectionState) &&
            (identical(other.locationsSent, locationsSent) ||
                other.locationsSent == locationsSent) &&
            (identical(other.locationsCached, locationsCached) ||
                other.locationsCached == locationsCached) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    isRunning,
    isConnected,
    connectionState,
    locationsSent,
    locationsCached,
    currentLocation,
  );

  /// Create a copy of TrackingStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackingStatusImplCopyWith<_$TrackingStatusImpl> get copyWith =>
      __$$TrackingStatusImplCopyWithImpl<_$TrackingStatusImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackingStatusImplToJson(this);
  }
}

abstract class _TrackingStatus implements TrackingStatus {
  const factory _TrackingStatus({
    required final bool isRunning,
    required final bool isConnected,
    required final String connectionState,
    required final int locationsSent,
    required final int locationsCached,
    final Location? currentLocation,
  }) = _$TrackingStatusImpl;

  factory _TrackingStatus.fromJson(Map<String, dynamic> json) =
      _$TrackingStatusImpl.fromJson;

  @override
  bool get isRunning;
  @override
  bool get isConnected;
  @override
  String get connectionState;
  @override
  int get locationsSent;
  @override
  int get locationsCached;
  @override
  Location? get currentLocation;

  /// Create a copy of TrackingStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackingStatusImplCopyWith<_$TrackingStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
