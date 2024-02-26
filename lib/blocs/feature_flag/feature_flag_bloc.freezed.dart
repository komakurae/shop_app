// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_flag_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FeatureFlagEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String featureName, Identity? identity)
        initialize,
    required TResult Function(String featureName) register,
    required TResult Function(bool reload) load,
    required TResult Function(Identity? identity) changeIdentity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String featureName, Identity? identity)? initialize,
    TResult? Function(String featureName)? register,
    TResult? Function(bool reload)? load,
    TResult? Function(Identity? identity)? changeIdentity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String featureName, Identity? identity)? initialize,
    TResult Function(String featureName)? register,
    TResult Function(bool reload)? load,
    TResult Function(Identity? identity)? changeIdentity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Register value) register,
    required TResult Function(_Load value) load,
    required TResult Function(_ChangeIdentity value) changeIdentity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Register value)? register,
    TResult? Function(_Load value)? load,
    TResult? Function(_ChangeIdentity value)? changeIdentity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Register value)? register,
    TResult Function(_Load value)? load,
    TResult Function(_ChangeIdentity value)? changeIdentity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureFlagEventCopyWith<$Res> {
  factory $FeatureFlagEventCopyWith(
          FeatureFlagEvent value, $Res Function(FeatureFlagEvent) then) =
      _$FeatureFlagEventCopyWithImpl<$Res, FeatureFlagEvent>;
}

/// @nodoc
class _$FeatureFlagEventCopyWithImpl<$Res, $Val extends FeatureFlagEvent>
    implements $FeatureFlagEventCopyWith<$Res> {
  _$FeatureFlagEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String featureName, Identity? identity});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$FeatureFlagEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featureName = null,
    Object? identity = freezed,
  }) {
    return _then(_$InitializeImpl(
      featureName: null == featureName
          ? _value.featureName
          : featureName // ignore: cast_nullable_to_non_nullable
              as String,
      identity: freezed == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as Identity?,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl({required this.featureName, this.identity});

  @override
  final String featureName;
  @override
  final Identity? identity;

  @override
  String toString() {
    return 'FeatureFlagEvent.initialize(featureName: $featureName, identity: $identity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.featureName, featureName) ||
                other.featureName == featureName) &&
            (identical(other.identity, identity) ||
                other.identity == identity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, featureName, identity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String featureName, Identity? identity)
        initialize,
    required TResult Function(String featureName) register,
    required TResult Function(bool reload) load,
    required TResult Function(Identity? identity) changeIdentity,
  }) {
    return initialize(featureName, identity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String featureName, Identity? identity)? initialize,
    TResult? Function(String featureName)? register,
    TResult? Function(bool reload)? load,
    TResult? Function(Identity? identity)? changeIdentity,
  }) {
    return initialize?.call(featureName, identity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String featureName, Identity? identity)? initialize,
    TResult Function(String featureName)? register,
    TResult Function(bool reload)? load,
    TResult Function(Identity? identity)? changeIdentity,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(featureName, identity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Register value) register,
    required TResult Function(_Load value) load,
    required TResult Function(_ChangeIdentity value) changeIdentity,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Register value)? register,
    TResult? Function(_Load value)? load,
    TResult? Function(_ChangeIdentity value)? changeIdentity,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Register value)? register,
    TResult Function(_Load value)? load,
    TResult Function(_ChangeIdentity value)? changeIdentity,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements FeatureFlagEvent {
  const factory _Initialize(
      {required final String featureName,
      final Identity? identity}) = _$InitializeImpl;

  String get featureName;
  Identity? get identity;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterImplCopyWith<$Res> {
  factory _$$RegisterImplCopyWith(
          _$RegisterImpl value, $Res Function(_$RegisterImpl) then) =
      __$$RegisterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String featureName});
}

/// @nodoc
class __$$RegisterImplCopyWithImpl<$Res>
    extends _$FeatureFlagEventCopyWithImpl<$Res, _$RegisterImpl>
    implements _$$RegisterImplCopyWith<$Res> {
  __$$RegisterImplCopyWithImpl(
      _$RegisterImpl _value, $Res Function(_$RegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featureName = null,
  }) {
    return _then(_$RegisterImpl(
      featureName: null == featureName
          ? _value.featureName
          : featureName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterImpl implements _Register {
  const _$RegisterImpl({required this.featureName});

  @override
  final String featureName;

  @override
  String toString() {
    return 'FeatureFlagEvent.register(featureName: $featureName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterImpl &&
            (identical(other.featureName, featureName) ||
                other.featureName == featureName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, featureName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      __$$RegisterImplCopyWithImpl<_$RegisterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String featureName, Identity? identity)
        initialize,
    required TResult Function(String featureName) register,
    required TResult Function(bool reload) load,
    required TResult Function(Identity? identity) changeIdentity,
  }) {
    return register(featureName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String featureName, Identity? identity)? initialize,
    TResult? Function(String featureName)? register,
    TResult? Function(bool reload)? load,
    TResult? Function(Identity? identity)? changeIdentity,
  }) {
    return register?.call(featureName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String featureName, Identity? identity)? initialize,
    TResult Function(String featureName)? register,
    TResult Function(bool reload)? load,
    TResult Function(Identity? identity)? changeIdentity,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(featureName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Register value) register,
    required TResult Function(_Load value) load,
    required TResult Function(_ChangeIdentity value) changeIdentity,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Register value)? register,
    TResult? Function(_Load value)? load,
    TResult? Function(_ChangeIdentity value)? changeIdentity,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Register value)? register,
    TResult Function(_Load value)? load,
    TResult Function(_ChangeIdentity value)? changeIdentity,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class _Register implements FeatureFlagEvent {
  const factory _Register({required final String featureName}) = _$RegisterImpl;

  String get featureName;
  @JsonKey(ignore: true)
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
          _$LoadImpl value, $Res Function(_$LoadImpl) then) =
      __$$LoadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool reload});
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$FeatureFlagEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reload = null,
  }) {
    return _then(_$LoadImpl(
      reload: null == reload
          ? _value.reload
          : reload // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl({this.reload = true});

  @override
  @JsonKey()
  final bool reload;

  @override
  String toString() {
    return 'FeatureFlagEvent.load(reload: $reload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadImpl &&
            (identical(other.reload, reload) || other.reload == reload));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reload);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      __$$LoadImplCopyWithImpl<_$LoadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String featureName, Identity? identity)
        initialize,
    required TResult Function(String featureName) register,
    required TResult Function(bool reload) load,
    required TResult Function(Identity? identity) changeIdentity,
  }) {
    return load(reload);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String featureName, Identity? identity)? initialize,
    TResult? Function(String featureName)? register,
    TResult? Function(bool reload)? load,
    TResult? Function(Identity? identity)? changeIdentity,
  }) {
    return load?.call(reload);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String featureName, Identity? identity)? initialize,
    TResult Function(String featureName)? register,
    TResult Function(bool reload)? load,
    TResult Function(Identity? identity)? changeIdentity,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(reload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Register value) register,
    required TResult Function(_Load value) load,
    required TResult Function(_ChangeIdentity value) changeIdentity,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Register value)? register,
    TResult? Function(_Load value)? load,
    TResult? Function(_ChangeIdentity value)? changeIdentity,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Register value)? register,
    TResult Function(_Load value)? load,
    TResult Function(_ChangeIdentity value)? changeIdentity,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements FeatureFlagEvent {
  const factory _Load({final bool reload}) = _$LoadImpl;

  bool get reload;
  @JsonKey(ignore: true)
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeIdentityImplCopyWith<$Res> {
  factory _$$ChangeIdentityImplCopyWith(_$ChangeIdentityImpl value,
          $Res Function(_$ChangeIdentityImpl) then) =
      __$$ChangeIdentityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Identity? identity});
}

/// @nodoc
class __$$ChangeIdentityImplCopyWithImpl<$Res>
    extends _$FeatureFlagEventCopyWithImpl<$Res, _$ChangeIdentityImpl>
    implements _$$ChangeIdentityImplCopyWith<$Res> {
  __$$ChangeIdentityImplCopyWithImpl(
      _$ChangeIdentityImpl _value, $Res Function(_$ChangeIdentityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identity = freezed,
  }) {
    return _then(_$ChangeIdentityImpl(
      identity: freezed == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as Identity?,
    ));
  }
}

/// @nodoc

class _$ChangeIdentityImpl implements _ChangeIdentity {
  const _$ChangeIdentityImpl({this.identity});

  @override
  final Identity? identity;

  @override
  String toString() {
    return 'FeatureFlagEvent.changeIdentity(identity: $identity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeIdentityImpl &&
            (identical(other.identity, identity) ||
                other.identity == identity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeIdentityImplCopyWith<_$ChangeIdentityImpl> get copyWith =>
      __$$ChangeIdentityImplCopyWithImpl<_$ChangeIdentityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String featureName, Identity? identity)
        initialize,
    required TResult Function(String featureName) register,
    required TResult Function(bool reload) load,
    required TResult Function(Identity? identity) changeIdentity,
  }) {
    return changeIdentity(identity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String featureName, Identity? identity)? initialize,
    TResult? Function(String featureName)? register,
    TResult? Function(bool reload)? load,
    TResult? Function(Identity? identity)? changeIdentity,
  }) {
    return changeIdentity?.call(identity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String featureName, Identity? identity)? initialize,
    TResult Function(String featureName)? register,
    TResult Function(bool reload)? load,
    TResult Function(Identity? identity)? changeIdentity,
    required TResult orElse(),
  }) {
    if (changeIdentity != null) {
      return changeIdentity(identity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Register value) register,
    required TResult Function(_Load value) load,
    required TResult Function(_ChangeIdentity value) changeIdentity,
  }) {
    return changeIdentity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Register value)? register,
    TResult? Function(_Load value)? load,
    TResult? Function(_ChangeIdentity value)? changeIdentity,
  }) {
    return changeIdentity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Register value)? register,
    TResult Function(_Load value)? load,
    TResult Function(_ChangeIdentity value)? changeIdentity,
    required TResult orElse(),
  }) {
    if (changeIdentity != null) {
      return changeIdentity(this);
    }
    return orElse();
  }
}

abstract class _ChangeIdentity implements FeatureFlagEvent {
  const factory _ChangeIdentity({final Identity? identity}) =
      _$ChangeIdentityImpl;

  Identity? get identity;
  @JsonKey(ignore: true)
  _$$ChangeIdentityImplCopyWith<_$ChangeIdentityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FeatureFlagState {
  Map<FeatureFlag, bool> get flags => throw _privateConstructorUsedError;
  FeatureFlagStatus get status => throw _privateConstructorUsedError;
  Identity? get identity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeatureFlagStateCopyWith<FeatureFlagState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureFlagStateCopyWith<$Res> {
  factory $FeatureFlagStateCopyWith(
          FeatureFlagState value, $Res Function(FeatureFlagState) then) =
      _$FeatureFlagStateCopyWithImpl<$Res, FeatureFlagState>;
  @useResult
  $Res call(
      {Map<FeatureFlag, bool> flags,
      FeatureFlagStatus status,
      Identity? identity});
}

/// @nodoc
class _$FeatureFlagStateCopyWithImpl<$Res, $Val extends FeatureFlagState>
    implements $FeatureFlagStateCopyWith<$Res> {
  _$FeatureFlagStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flags = null,
    Object? status = null,
    Object? identity = freezed,
  }) {
    return _then(_value.copyWith(
      flags: null == flags
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as Map<FeatureFlag, bool>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FeatureFlagStatus,
      identity: freezed == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as Identity?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeatureFlagStateImplCopyWith<$Res>
    implements $FeatureFlagStateCopyWith<$Res> {
  factory _$$FeatureFlagStateImplCopyWith(_$FeatureFlagStateImpl value,
          $Res Function(_$FeatureFlagStateImpl) then) =
      __$$FeatureFlagStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<FeatureFlag, bool> flags,
      FeatureFlagStatus status,
      Identity? identity});
}

/// @nodoc
class __$$FeatureFlagStateImplCopyWithImpl<$Res>
    extends _$FeatureFlagStateCopyWithImpl<$Res, _$FeatureFlagStateImpl>
    implements _$$FeatureFlagStateImplCopyWith<$Res> {
  __$$FeatureFlagStateImplCopyWithImpl(_$FeatureFlagStateImpl _value,
      $Res Function(_$FeatureFlagStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flags = null,
    Object? status = null,
    Object? identity = freezed,
  }) {
    return _then(_$FeatureFlagStateImpl(
      flags: null == flags
          ? _value._flags
          : flags // ignore: cast_nullable_to_non_nullable
              as Map<FeatureFlag, bool>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FeatureFlagStatus,
      identity: freezed == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as Identity?,
    ));
  }
}

/// @nodoc

class _$FeatureFlagStateImpl extends _FeatureFlagState {
  const _$FeatureFlagStateImpl(
      {final Map<FeatureFlag, bool> flags = const {},
      this.status = FeatureFlagStatus.loading,
      this.identity})
      : _flags = flags,
        super._();

  final Map<FeatureFlag, bool> _flags;
  @override
  @JsonKey()
  Map<FeatureFlag, bool> get flags {
    if (_flags is EqualUnmodifiableMapView) return _flags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_flags);
  }

  @override
  @JsonKey()
  final FeatureFlagStatus status;
  @override
  final Identity? identity;

  @override
  String toString() {
    return 'FeatureFlagState(flags: $flags, status: $status, identity: $identity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureFlagStateImpl &&
            const DeepCollectionEquality().equals(other._flags, _flags) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.identity, identity) ||
                other.identity == identity));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_flags), status, identity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureFlagStateImplCopyWith<_$FeatureFlagStateImpl> get copyWith =>
      __$$FeatureFlagStateImplCopyWithImpl<_$FeatureFlagStateImpl>(
          this, _$identity);
}

abstract class _FeatureFlagState extends FeatureFlagState {
  const factory _FeatureFlagState(
      {final Map<FeatureFlag, bool> flags,
      final FeatureFlagStatus status,
      final Identity? identity}) = _$FeatureFlagStateImpl;
  const _FeatureFlagState._() : super._();

  @override
  Map<FeatureFlag, bool> get flags;
  @override
  FeatureFlagStatus get status;
  @override
  Identity? get identity;
  @override
  @JsonKey(ignore: true)
  _$$FeatureFlagStateImplCopyWith<_$FeatureFlagStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}