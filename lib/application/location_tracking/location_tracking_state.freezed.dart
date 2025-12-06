// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_tracking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LocationTrackingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )
    active,
    required TResult Function(int locationsSent, int locationsCached) stopped,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    active,
    TResult? Function(int locationsSent, int locationsCached)? stopped,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    active,
    TResult Function(int locationsSent, int locationsCached)? stopped,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Active value) active,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Active value)? active,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Active value)? active,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationTrackingStateCopyWith<$Res> {
  factory $LocationTrackingStateCopyWith(
    LocationTrackingState value,
    $Res Function(LocationTrackingState) then,
  ) = _$LocationTrackingStateCopyWithImpl<$Res, LocationTrackingState>;
}

/// @nodoc
class _$LocationTrackingStateCopyWithImpl<
  $Res,
  $Val extends LocationTrackingState
>
    implements $LocationTrackingStateCopyWith<$Res> {
  _$LocationTrackingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationTrackingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LocationTrackingStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationTrackingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'LocationTrackingState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )
    active,
    required TResult Function(int locationsSent, int locationsCached) stopped,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    active,
    TResult? Function(int locationsSent, int locationsCached)? stopped,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    active,
    TResult Function(int locationsSent, int locationsCached)? stopped,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Active value) active,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Active value)? active,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Active value)? active,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LocationTrackingState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$LocationTrackingStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationTrackingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'LocationTrackingState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )
    active,
    required TResult Function(int locationsSent, int locationsCached) stopped,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    active,
    TResult? Function(int locationsSent, int locationsCached)? stopped,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    active,
    TResult Function(int locationsSent, int locationsCached)? stopped,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Active value) active,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Active value)? active,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Active value)? active,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements LocationTrackingState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ActiveImplCopyWith<$Res> {
  factory _$$ActiveImplCopyWith(
    _$ActiveImpl value,
    $Res Function(_$ActiveImpl) then,
  ) = __$$ActiveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    bool isConnected,
    String connectionState,
    int locationsSent,
    int locationsCached,
    Location? currentLocation,
  });

  $LocationCopyWith<$Res>? get currentLocation;
}

/// @nodoc
class __$$ActiveImplCopyWithImpl<$Res>
    extends _$LocationTrackingStateCopyWithImpl<$Res, _$ActiveImpl>
    implements _$$ActiveImplCopyWith<$Res> {
  __$$ActiveImplCopyWithImpl(
    _$ActiveImpl _value,
    $Res Function(_$ActiveImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnected = null,
    Object? connectionState = null,
    Object? locationsSent = null,
    Object? locationsCached = null,
    Object? currentLocation = freezed,
  }) {
    return _then(
      _$ActiveImpl(
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

  /// Create a copy of LocationTrackingState
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

class _$ActiveImpl implements _Active {
  const _$ActiveImpl({
    required this.isConnected,
    required this.connectionState,
    required this.locationsSent,
    required this.locationsCached,
    this.currentLocation,
  });

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
    return 'LocationTrackingState.active(isConnected: $isConnected, connectionState: $connectionState, locationsSent: $locationsSent, locationsCached: $locationsCached, currentLocation: $currentLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveImpl &&
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
    isConnected,
    connectionState,
    locationsSent,
    locationsCached,
    currentLocation,
  );

  /// Create a copy of LocationTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveImplCopyWith<_$ActiveImpl> get copyWith =>
      __$$ActiveImplCopyWithImpl<_$ActiveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )
    active,
    required TResult Function(int locationsSent, int locationsCached) stopped,
    required TResult Function(String message) error,
  }) {
    return active(
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
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    active,
    TResult? Function(int locationsSent, int locationsCached)? stopped,
    TResult? Function(String message)? error,
  }) {
    return active?.call(
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
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    active,
    TResult Function(int locationsSent, int locationsCached)? stopped,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Active value) active,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Error value) error,
  }) {
    return active(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Active value)? active,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Error value)? error,
  }) {
    return active?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Active value)? active,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(this);
    }
    return orElse();
  }
}

abstract class _Active implements LocationTrackingState {
  const factory _Active({
    required final bool isConnected,
    required final String connectionState,
    required final int locationsSent,
    required final int locationsCached,
    final Location? currentLocation,
  }) = _$ActiveImpl;

  bool get isConnected;
  String get connectionState;
  int get locationsSent;
  int get locationsCached;
  Location? get currentLocation;

  /// Create a copy of LocationTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActiveImplCopyWith<_$ActiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoppedImplCopyWith<$Res> {
  factory _$$StoppedImplCopyWith(
    _$StoppedImpl value,
    $Res Function(_$StoppedImpl) then,
  ) = __$$StoppedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int locationsSent, int locationsCached});
}

/// @nodoc
class __$$StoppedImplCopyWithImpl<$Res>
    extends _$LocationTrackingStateCopyWithImpl<$Res, _$StoppedImpl>
    implements _$$StoppedImplCopyWith<$Res> {
  __$$StoppedImplCopyWithImpl(
    _$StoppedImpl _value,
    $Res Function(_$StoppedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? locationsSent = null, Object? locationsCached = null}) {
    return _then(
      _$StoppedImpl(
        locationsSent: null == locationsSent
            ? _value.locationsSent
            : locationsSent // ignore: cast_nullable_to_non_nullable
                  as int,
        locationsCached: null == locationsCached
            ? _value.locationsCached
            : locationsCached // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$StoppedImpl implements _Stopped {
  const _$StoppedImpl({this.locationsSent = 0, this.locationsCached = 0});

  @override
  @JsonKey()
  final int locationsSent;
  @override
  @JsonKey()
  final int locationsCached;

  @override
  String toString() {
    return 'LocationTrackingState.stopped(locationsSent: $locationsSent, locationsCached: $locationsCached)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoppedImpl &&
            (identical(other.locationsSent, locationsSent) ||
                other.locationsSent == locationsSent) &&
            (identical(other.locationsCached, locationsCached) ||
                other.locationsCached == locationsCached));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locationsSent, locationsCached);

  /// Create a copy of LocationTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoppedImplCopyWith<_$StoppedImpl> get copyWith =>
      __$$StoppedImplCopyWithImpl<_$StoppedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )
    active,
    required TResult Function(int locationsSent, int locationsCached) stopped,
    required TResult Function(String message) error,
  }) {
    return stopped(locationsSent, locationsCached);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    active,
    TResult? Function(int locationsSent, int locationsCached)? stopped,
    TResult? Function(String message)? error,
  }) {
    return stopped?.call(locationsSent, locationsCached);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    active,
    TResult Function(int locationsSent, int locationsCached)? stopped,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped(locationsSent, locationsCached);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Active value) active,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Error value) error,
  }) {
    return stopped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Active value)? active,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Error value)? error,
  }) {
    return stopped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Active value)? active,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped(this);
    }
    return orElse();
  }
}

abstract class _Stopped implements LocationTrackingState {
  const factory _Stopped({final int locationsSent, final int locationsCached}) =
      _$StoppedImpl;

  int get locationsSent;
  int get locationsCached;

  /// Create a copy of LocationTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoppedImplCopyWith<_$StoppedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$LocationTrackingStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LocationTrackingState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of LocationTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )
    active,
    required TResult Function(int locationsSent, int locationsCached) stopped,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    active,
    TResult? Function(int locationsSent, int locationsCached)? stopped,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      bool isConnected,
      String connectionState,
      int locationsSent,
      int locationsCached,
      Location? currentLocation,
    )?
    active,
    TResult Function(int locationsSent, int locationsCached)? stopped,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Active value) active,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Active value)? active,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Active value)? active,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements LocationTrackingState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of LocationTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
