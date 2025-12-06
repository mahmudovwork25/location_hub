// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_tracking_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LocationTrackingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTracking,
    required TResult Function() stopTracking,
    required TResult Function(Location location) locationUpdated,
    required TResult Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )
    statusUpdated,
    required TResult Function() requestStatus,
    required TResult Function() syncCachedLocations,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTracking,
    TResult? Function()? stopTracking,
    TResult? Function(Location location)? locationUpdated,
    TResult? Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    statusUpdated,
    TResult? Function()? requestStatus,
    TResult? Function()? syncCachedLocations,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTracking,
    TResult Function()? stopTracking,
    TResult Function(Location location)? locationUpdated,
    TResult Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    statusUpdated,
    TResult Function()? requestStatus,
    TResult Function()? syncCachedLocations,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartTracking value) startTracking,
    required TResult Function(StopTracking value) stopTracking,
    required TResult Function(LocationUpdated value) locationUpdated,
    required TResult Function(StatusUpdated value) statusUpdated,
    required TResult Function(RequestStatus value) requestStatus,
    required TResult Function(SyncCachedLocations value) syncCachedLocations,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartTracking value)? startTracking,
    TResult? Function(StopTracking value)? stopTracking,
    TResult? Function(LocationUpdated value)? locationUpdated,
    TResult? Function(StatusUpdated value)? statusUpdated,
    TResult? Function(RequestStatus value)? requestStatus,
    TResult? Function(SyncCachedLocations value)? syncCachedLocations,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartTracking value)? startTracking,
    TResult Function(StopTracking value)? stopTracking,
    TResult Function(LocationUpdated value)? locationUpdated,
    TResult Function(StatusUpdated value)? statusUpdated,
    TResult Function(RequestStatus value)? requestStatus,
    TResult Function(SyncCachedLocations value)? syncCachedLocations,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationTrackingEventCopyWith<$Res> {
  factory $LocationTrackingEventCopyWith(
    LocationTrackingEvent value,
    $Res Function(LocationTrackingEvent) then,
  ) = _$LocationTrackingEventCopyWithImpl<$Res, LocationTrackingEvent>;
}

/// @nodoc
class _$LocationTrackingEventCopyWithImpl<
  $Res,
  $Val extends LocationTrackingEvent
>
    implements $LocationTrackingEventCopyWith<$Res> {
  _$LocationTrackingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationTrackingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartTrackingImplCopyWith<$Res> {
  factory _$$StartTrackingImplCopyWith(
    _$StartTrackingImpl value,
    $Res Function(_$StartTrackingImpl) then,
  ) = __$$StartTrackingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartTrackingImplCopyWithImpl<$Res>
    extends _$LocationTrackingEventCopyWithImpl<$Res, _$StartTrackingImpl>
    implements _$$StartTrackingImplCopyWith<$Res> {
  __$$StartTrackingImplCopyWithImpl(
    _$StartTrackingImpl _value,
    $Res Function(_$StartTrackingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationTrackingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartTrackingImpl implements StartTracking {
  const _$StartTrackingImpl();

  @override
  String toString() {
    return 'LocationTrackingEvent.startTracking()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartTrackingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTracking,
    required TResult Function() stopTracking,
    required TResult Function(Location location) locationUpdated,
    required TResult Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )
    statusUpdated,
    required TResult Function() requestStatus,
    required TResult Function() syncCachedLocations,
  }) {
    return startTracking();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTracking,
    TResult? Function()? stopTracking,
    TResult? Function(Location location)? locationUpdated,
    TResult? Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    statusUpdated,
    TResult? Function()? requestStatus,
    TResult? Function()? syncCachedLocations,
  }) {
    return startTracking?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTracking,
    TResult Function()? stopTracking,
    TResult Function(Location location)? locationUpdated,
    TResult Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    statusUpdated,
    TResult Function()? requestStatus,
    TResult Function()? syncCachedLocations,
    required TResult orElse(),
  }) {
    if (startTracking != null) {
      return startTracking();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartTracking value) startTracking,
    required TResult Function(StopTracking value) stopTracking,
    required TResult Function(LocationUpdated value) locationUpdated,
    required TResult Function(StatusUpdated value) statusUpdated,
    required TResult Function(RequestStatus value) requestStatus,
    required TResult Function(SyncCachedLocations value) syncCachedLocations,
  }) {
    return startTracking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartTracking value)? startTracking,
    TResult? Function(StopTracking value)? stopTracking,
    TResult? Function(LocationUpdated value)? locationUpdated,
    TResult? Function(StatusUpdated value)? statusUpdated,
    TResult? Function(RequestStatus value)? requestStatus,
    TResult? Function(SyncCachedLocations value)? syncCachedLocations,
  }) {
    return startTracking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartTracking value)? startTracking,
    TResult Function(StopTracking value)? stopTracking,
    TResult Function(LocationUpdated value)? locationUpdated,
    TResult Function(StatusUpdated value)? statusUpdated,
    TResult Function(RequestStatus value)? requestStatus,
    TResult Function(SyncCachedLocations value)? syncCachedLocations,
    required TResult orElse(),
  }) {
    if (startTracking != null) {
      return startTracking(this);
    }
    return orElse();
  }
}

abstract class StartTracking implements LocationTrackingEvent {
  const factory StartTracking() = _$StartTrackingImpl;
}

/// @nodoc
abstract class _$$StopTrackingImplCopyWith<$Res> {
  factory _$$StopTrackingImplCopyWith(
    _$StopTrackingImpl value,
    $Res Function(_$StopTrackingImpl) then,
  ) = __$$StopTrackingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopTrackingImplCopyWithImpl<$Res>
    extends _$LocationTrackingEventCopyWithImpl<$Res, _$StopTrackingImpl>
    implements _$$StopTrackingImplCopyWith<$Res> {
  __$$StopTrackingImplCopyWithImpl(
    _$StopTrackingImpl _value,
    $Res Function(_$StopTrackingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationTrackingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StopTrackingImpl implements StopTracking {
  const _$StopTrackingImpl();

  @override
  String toString() {
    return 'LocationTrackingEvent.stopTracking()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StopTrackingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTracking,
    required TResult Function() stopTracking,
    required TResult Function(Location location) locationUpdated,
    required TResult Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )
    statusUpdated,
    required TResult Function() requestStatus,
    required TResult Function() syncCachedLocations,
  }) {
    return stopTracking();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTracking,
    TResult? Function()? stopTracking,
    TResult? Function(Location location)? locationUpdated,
    TResult? Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    statusUpdated,
    TResult? Function()? requestStatus,
    TResult? Function()? syncCachedLocations,
  }) {
    return stopTracking?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTracking,
    TResult Function()? stopTracking,
    TResult Function(Location location)? locationUpdated,
    TResult Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    statusUpdated,
    TResult Function()? requestStatus,
    TResult Function()? syncCachedLocations,
    required TResult orElse(),
  }) {
    if (stopTracking != null) {
      return stopTracking();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartTracking value) startTracking,
    required TResult Function(StopTracking value) stopTracking,
    required TResult Function(LocationUpdated value) locationUpdated,
    required TResult Function(StatusUpdated value) statusUpdated,
    required TResult Function(RequestStatus value) requestStatus,
    required TResult Function(SyncCachedLocations value) syncCachedLocations,
  }) {
    return stopTracking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartTracking value)? startTracking,
    TResult? Function(StopTracking value)? stopTracking,
    TResult? Function(LocationUpdated value)? locationUpdated,
    TResult? Function(StatusUpdated value)? statusUpdated,
    TResult? Function(RequestStatus value)? requestStatus,
    TResult? Function(SyncCachedLocations value)? syncCachedLocations,
  }) {
    return stopTracking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartTracking value)? startTracking,
    TResult Function(StopTracking value)? stopTracking,
    TResult Function(LocationUpdated value)? locationUpdated,
    TResult Function(StatusUpdated value)? statusUpdated,
    TResult Function(RequestStatus value)? requestStatus,
    TResult Function(SyncCachedLocations value)? syncCachedLocations,
    required TResult orElse(),
  }) {
    if (stopTracking != null) {
      return stopTracking(this);
    }
    return orElse();
  }
}

abstract class StopTracking implements LocationTrackingEvent {
  const factory StopTracking() = _$StopTrackingImpl;
}

/// @nodoc
abstract class _$$LocationUpdatedImplCopyWith<$Res> {
  factory _$$LocationUpdatedImplCopyWith(
    _$LocationUpdatedImpl value,
    $Res Function(_$LocationUpdatedImpl) then,
  ) = __$$LocationUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Location location});

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$LocationUpdatedImplCopyWithImpl<$Res>
    extends _$LocationTrackingEventCopyWithImpl<$Res, _$LocationUpdatedImpl>
    implements _$$LocationUpdatedImplCopyWith<$Res> {
  __$$LocationUpdatedImplCopyWithImpl(
    _$LocationUpdatedImpl _value,
    $Res Function(_$LocationUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationTrackingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? location = null}) {
    return _then(
      _$LocationUpdatedImpl(
        null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as Location,
      ),
    );
  }

  /// Create a copy of LocationTrackingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc

class _$LocationUpdatedImpl implements LocationUpdated {
  const _$LocationUpdatedImpl(this.location);

  @override
  final Location location;

  @override
  String toString() {
    return 'LocationTrackingEvent.locationUpdated(location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationUpdatedImpl &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(runtimeType, location);

  /// Create a copy of LocationTrackingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationUpdatedImplCopyWith<_$LocationUpdatedImpl> get copyWith =>
      __$$LocationUpdatedImplCopyWithImpl<_$LocationUpdatedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTracking,
    required TResult Function() stopTracking,
    required TResult Function(Location location) locationUpdated,
    required TResult Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )
    statusUpdated,
    required TResult Function() requestStatus,
    required TResult Function() syncCachedLocations,
  }) {
    return locationUpdated(location);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTracking,
    TResult? Function()? stopTracking,
    TResult? Function(Location location)? locationUpdated,
    TResult? Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    statusUpdated,
    TResult? Function()? requestStatus,
    TResult? Function()? syncCachedLocations,
  }) {
    return locationUpdated?.call(location);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTracking,
    TResult Function()? stopTracking,
    TResult Function(Location location)? locationUpdated,
    TResult Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    statusUpdated,
    TResult Function()? requestStatus,
    TResult Function()? syncCachedLocations,
    required TResult orElse(),
  }) {
    if (locationUpdated != null) {
      return locationUpdated(location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartTracking value) startTracking,
    required TResult Function(StopTracking value) stopTracking,
    required TResult Function(LocationUpdated value) locationUpdated,
    required TResult Function(StatusUpdated value) statusUpdated,
    required TResult Function(RequestStatus value) requestStatus,
    required TResult Function(SyncCachedLocations value) syncCachedLocations,
  }) {
    return locationUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartTracking value)? startTracking,
    TResult? Function(StopTracking value)? stopTracking,
    TResult? Function(LocationUpdated value)? locationUpdated,
    TResult? Function(StatusUpdated value)? statusUpdated,
    TResult? Function(RequestStatus value)? requestStatus,
    TResult? Function(SyncCachedLocations value)? syncCachedLocations,
  }) {
    return locationUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartTracking value)? startTracking,
    TResult Function(StopTracking value)? stopTracking,
    TResult Function(LocationUpdated value)? locationUpdated,
    TResult Function(StatusUpdated value)? statusUpdated,
    TResult Function(RequestStatus value)? requestStatus,
    TResult Function(SyncCachedLocations value)? syncCachedLocations,
    required TResult orElse(),
  }) {
    if (locationUpdated != null) {
      return locationUpdated(this);
    }
    return orElse();
  }
}

abstract class LocationUpdated implements LocationTrackingEvent {
  const factory LocationUpdated(final Location location) =
      _$LocationUpdatedImpl;

  Location get location;

  /// Create a copy of LocationTrackingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationUpdatedImplCopyWith<_$LocationUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatusUpdatedImplCopyWith<$Res> {
  factory _$$StatusUpdatedImplCopyWith(
    _$StatusUpdatedImpl value,
    $Res Function(_$StatusUpdatedImpl) then,
  ) = __$$StatusUpdatedImplCopyWithImpl<$Res>;
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
class __$$StatusUpdatedImplCopyWithImpl<$Res>
    extends _$LocationTrackingEventCopyWithImpl<$Res, _$StatusUpdatedImpl>
    implements _$$StatusUpdatedImplCopyWith<$Res> {
  __$$StatusUpdatedImplCopyWithImpl(
    _$StatusUpdatedImpl _value,
    $Res Function(_$StatusUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationTrackingEvent
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
      _$StatusUpdatedImpl(
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

  /// Create a copy of LocationTrackingEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get currentLocation {
    if (_value.currentLocation == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.currentLocation!, (value) {
      return _then(_value.copyWith(currentLocation: value));
    });
  }
}

/// @nodoc

class _$StatusUpdatedImpl implements StatusUpdated {
  const _$StatusUpdatedImpl({
    required this.isRunning,
    required this.isConnected,
    required this.connectionState,
    required this.locationsSent,
    required this.locationsCached,
    this.currentLocation,
  });

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
    return 'LocationTrackingEvent.statusUpdated(isRunning: $isRunning, isConnected: $isConnected, connectionState: $connectionState, locationsSent: $locationsSent, locationsCached: $locationsCached, currentLocation: $currentLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusUpdatedImpl &&
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

  /// Create a copy of LocationTrackingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusUpdatedImplCopyWith<_$StatusUpdatedImpl> get copyWith =>
      __$$StatusUpdatedImplCopyWithImpl<_$StatusUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTracking,
    required TResult Function() stopTracking,
    required TResult Function(Location location) locationUpdated,
    required TResult Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )
    statusUpdated,
    required TResult Function() requestStatus,
    required TResult Function() syncCachedLocations,
  }) {
    return statusUpdated(
      isRunning,
      isConnected,
      connectionState,
      locationsSent,
      locationsCached,
      currentLocation,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTracking,
    TResult? Function()? stopTracking,
    TResult? Function(Location location)? locationUpdated,
    TResult? Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    statusUpdated,
    TResult? Function()? requestStatus,
    TResult? Function()? syncCachedLocations,
  }) {
    return statusUpdated?.call(
      isRunning,
      isConnected,
      connectionState,
      locationsSent,
      locationsCached,
      currentLocation,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTracking,
    TResult Function()? stopTracking,
    TResult Function(Location location)? locationUpdated,
    TResult Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    statusUpdated,
    TResult Function()? requestStatus,
    TResult Function()? syncCachedLocations,
    required TResult orElse(),
  }) {
    if (statusUpdated != null) {
      return statusUpdated(
        isRunning,
        isConnected,
        connectionState,
        locationsSent,
        locationsCached,
        currentLocation,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartTracking value) startTracking,
    required TResult Function(StopTracking value) stopTracking,
    required TResult Function(LocationUpdated value) locationUpdated,
    required TResult Function(StatusUpdated value) statusUpdated,
    required TResult Function(RequestStatus value) requestStatus,
    required TResult Function(SyncCachedLocations value) syncCachedLocations,
  }) {
    return statusUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartTracking value)? startTracking,
    TResult? Function(StopTracking value)? stopTracking,
    TResult? Function(LocationUpdated value)? locationUpdated,
    TResult? Function(StatusUpdated value)? statusUpdated,
    TResult? Function(RequestStatus value)? requestStatus,
    TResult? Function(SyncCachedLocations value)? syncCachedLocations,
  }) {
    return statusUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartTracking value)? startTracking,
    TResult Function(StopTracking value)? stopTracking,
    TResult Function(LocationUpdated value)? locationUpdated,
    TResult Function(StatusUpdated value)? statusUpdated,
    TResult Function(RequestStatus value)? requestStatus,
    TResult Function(SyncCachedLocations value)? syncCachedLocations,
    required TResult orElse(),
  }) {
    if (statusUpdated != null) {
      return statusUpdated(this);
    }
    return orElse();
  }
}

abstract class StatusUpdated implements LocationTrackingEvent {
  const factory StatusUpdated({
    required final bool isRunning,
    required final bool isConnected,
    required final String connectionState,
    required final int locationsSent,
    required final int locationsCached,
    final Location? currentLocation,
  }) = _$StatusUpdatedImpl;

  bool get isRunning;
  bool get isConnected;
  String get connectionState;
  int get locationsSent;
  int get locationsCached;
  Location? get currentLocation;

  /// Create a copy of LocationTrackingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusUpdatedImplCopyWith<_$StatusUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestStatusImplCopyWith<$Res> {
  factory _$$RequestStatusImplCopyWith(
    _$RequestStatusImpl value,
    $Res Function(_$RequestStatusImpl) then,
  ) = __$$RequestStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestStatusImplCopyWithImpl<$Res>
    extends _$LocationTrackingEventCopyWithImpl<$Res, _$RequestStatusImpl>
    implements _$$RequestStatusImplCopyWith<$Res> {
  __$$RequestStatusImplCopyWithImpl(
    _$RequestStatusImpl _value,
    $Res Function(_$RequestStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationTrackingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RequestStatusImpl implements RequestStatus {
  const _$RequestStatusImpl();

  @override
  String toString() {
    return 'LocationTrackingEvent.requestStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTracking,
    required TResult Function() stopTracking,
    required TResult Function(Location location) locationUpdated,
    required TResult Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )
    statusUpdated,
    required TResult Function() requestStatus,
    required TResult Function() syncCachedLocations,
  }) {
    return requestStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTracking,
    TResult? Function()? stopTracking,
    TResult? Function(Location location)? locationUpdated,
    TResult? Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    statusUpdated,
    TResult? Function()? requestStatus,
    TResult? Function()? syncCachedLocations,
  }) {
    return requestStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTracking,
    TResult Function()? stopTracking,
    TResult Function(Location location)? locationUpdated,
    TResult Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    statusUpdated,
    TResult Function()? requestStatus,
    TResult Function()? syncCachedLocations,
    required TResult orElse(),
  }) {
    if (requestStatus != null) {
      return requestStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartTracking value) startTracking,
    required TResult Function(StopTracking value) stopTracking,
    required TResult Function(LocationUpdated value) locationUpdated,
    required TResult Function(StatusUpdated value) statusUpdated,
    required TResult Function(RequestStatus value) requestStatus,
    required TResult Function(SyncCachedLocations value) syncCachedLocations,
  }) {
    return requestStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartTracking value)? startTracking,
    TResult? Function(StopTracking value)? stopTracking,
    TResult? Function(LocationUpdated value)? locationUpdated,
    TResult? Function(StatusUpdated value)? statusUpdated,
    TResult? Function(RequestStatus value)? requestStatus,
    TResult? Function(SyncCachedLocations value)? syncCachedLocations,
  }) {
    return requestStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartTracking value)? startTracking,
    TResult Function(StopTracking value)? stopTracking,
    TResult Function(LocationUpdated value)? locationUpdated,
    TResult Function(StatusUpdated value)? statusUpdated,
    TResult Function(RequestStatus value)? requestStatus,
    TResult Function(SyncCachedLocations value)? syncCachedLocations,
    required TResult orElse(),
  }) {
    if (requestStatus != null) {
      return requestStatus(this);
    }
    return orElse();
  }
}

abstract class RequestStatus implements LocationTrackingEvent {
  const factory RequestStatus() = _$RequestStatusImpl;
}

/// @nodoc
abstract class _$$SyncCachedLocationsImplCopyWith<$Res> {
  factory _$$SyncCachedLocationsImplCopyWith(
    _$SyncCachedLocationsImpl value,
    $Res Function(_$SyncCachedLocationsImpl) then,
  ) = __$$SyncCachedLocationsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncCachedLocationsImplCopyWithImpl<$Res>
    extends _$LocationTrackingEventCopyWithImpl<$Res, _$SyncCachedLocationsImpl>
    implements _$$SyncCachedLocationsImplCopyWith<$Res> {
  __$$SyncCachedLocationsImplCopyWithImpl(
    _$SyncCachedLocationsImpl _value,
    $Res Function(_$SyncCachedLocationsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationTrackingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SyncCachedLocationsImpl implements SyncCachedLocations {
  const _$SyncCachedLocationsImpl();

  @override
  String toString() {
    return 'LocationTrackingEvent.syncCachedLocations()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncCachedLocationsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTracking,
    required TResult Function() stopTracking,
    required TResult Function(Location location) locationUpdated,
    required TResult Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )
    statusUpdated,
    required TResult Function() requestStatus,
    required TResult Function() syncCachedLocations,
  }) {
    return syncCachedLocations();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTracking,
    TResult? Function()? stopTracking,
    TResult? Function(Location location)? locationUpdated,
    TResult? Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    statusUpdated,
    TResult? Function()? requestStatus,
    TResult? Function()? syncCachedLocations,
  }) {
    return syncCachedLocations?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTracking,
    TResult Function()? stopTracking,
    TResult Function(Location location)? locationUpdated,
    TResult Function(
      bool isRunning,
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    statusUpdated,
    TResult Function()? requestStatus,
    TResult Function()? syncCachedLocations,
    required TResult orElse(),
  }) {
    if (syncCachedLocations != null) {
      return syncCachedLocations();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartTracking value) startTracking,
    required TResult Function(StopTracking value) stopTracking,
    required TResult Function(LocationUpdated value) locationUpdated,
    required TResult Function(StatusUpdated value) statusUpdated,
    required TResult Function(RequestStatus value) requestStatus,
    required TResult Function(SyncCachedLocations value) syncCachedLocations,
  }) {
    return syncCachedLocations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartTracking value)? startTracking,
    TResult? Function(StopTracking value)? stopTracking,
    TResult? Function(LocationUpdated value)? locationUpdated,
    TResult? Function(StatusUpdated value)? statusUpdated,
    TResult? Function(RequestStatus value)? requestStatus,
    TResult? Function(SyncCachedLocations value)? syncCachedLocations,
  }) {
    return syncCachedLocations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartTracking value)? startTracking,
    TResult Function(StopTracking value)? stopTracking,
    TResult Function(LocationUpdated value)? locationUpdated,
    TResult Function(StatusUpdated value)? statusUpdated,
    TResult Function(RequestStatus value)? requestStatus,
    TResult Function(SyncCachedLocations value)? syncCachedLocations,
    required TResult orElse(),
  }) {
    if (syncCachedLocations != null) {
      return syncCachedLocations(this);
    }
    return orElse();
  }
}

abstract class SyncCachedLocations implements LocationTrackingEvent {
  const factory SyncCachedLocations() = _$SyncCachedLocationsImpl;
}
