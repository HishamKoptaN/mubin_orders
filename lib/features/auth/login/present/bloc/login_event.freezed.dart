// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEvent {
  FirabaseLoginReqBodyModel get firabaseLoginReqBodyModel =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            FirabaseLoginReqBodyModel firabaseLoginReqBodyModel)
        fireLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FirabaseLoginReqBodyModel firabaseLoginReqBodyModel)?
        fireLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FirabaseLoginReqBodyModel firabaseLoginReqBodyModel)?
        fireLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FireLogin value) fireLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FireLogin value)? fireLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FireLogin value)? fireLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginEventCopyWith<LoginEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
  @useResult
  $Res call({FirabaseLoginReqBodyModel firabaseLoginReqBodyModel});

  $FirabaseLoginReqBodyModelCopyWith<$Res> get firabaseLoginReqBodyModel;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firabaseLoginReqBodyModel = null,
  }) {
    return _then(_value.copyWith(
      firabaseLoginReqBodyModel: null == firabaseLoginReqBodyModel
          ? _value.firabaseLoginReqBodyModel
          : firabaseLoginReqBodyModel // ignore: cast_nullable_to_non_nullable
              as FirabaseLoginReqBodyModel,
    ) as $Val);
  }

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FirabaseLoginReqBodyModelCopyWith<$Res> get firabaseLoginReqBodyModel {
    return $FirabaseLoginReqBodyModelCopyWith<$Res>(
        _value.firabaseLoginReqBodyModel, (value) {
      return _then(_value.copyWith(firabaseLoginReqBodyModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FireLoginImplCopyWith<$Res>
    implements $LoginEventCopyWith<$Res> {
  factory _$$FireLoginImplCopyWith(
          _$FireLoginImpl value, $Res Function(_$FireLoginImpl) then) =
      __$$FireLoginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FirabaseLoginReqBodyModel firabaseLoginReqBodyModel});

  @override
  $FirabaseLoginReqBodyModelCopyWith<$Res> get firabaseLoginReqBodyModel;
}

/// @nodoc
class __$$FireLoginImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$FireLoginImpl>
    implements _$$FireLoginImplCopyWith<$Res> {
  __$$FireLoginImplCopyWithImpl(
      _$FireLoginImpl _value, $Res Function(_$FireLoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firabaseLoginReqBodyModel = null,
  }) {
    return _then(_$FireLoginImpl(
      firabaseLoginReqBodyModel: null == firabaseLoginReqBodyModel
          ? _value.firabaseLoginReqBodyModel
          : firabaseLoginReqBodyModel // ignore: cast_nullable_to_non_nullable
              as FirabaseLoginReqBodyModel,
    ));
  }
}

/// @nodoc

class _$FireLoginImpl implements _FireLogin {
  const _$FireLoginImpl({required this.firabaseLoginReqBodyModel});

  @override
  final FirabaseLoginReqBodyModel firabaseLoginReqBodyModel;

  @override
  String toString() {
    return 'LoginEvent.fireLogin(firabaseLoginReqBodyModel: $firabaseLoginReqBodyModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FireLoginImpl &&
            (identical(other.firabaseLoginReqBodyModel,
                    firabaseLoginReqBodyModel) ||
                other.firabaseLoginReqBodyModel == firabaseLoginReqBodyModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firabaseLoginReqBodyModel);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FireLoginImplCopyWith<_$FireLoginImpl> get copyWith =>
      __$$FireLoginImplCopyWithImpl<_$FireLoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            FirabaseLoginReqBodyModel firabaseLoginReqBodyModel)
        fireLogin,
  }) {
    return fireLogin(firabaseLoginReqBodyModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FirabaseLoginReqBodyModel firabaseLoginReqBodyModel)?
        fireLogin,
  }) {
    return fireLogin?.call(firabaseLoginReqBodyModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FirabaseLoginReqBodyModel firabaseLoginReqBodyModel)?
        fireLogin,
    required TResult orElse(),
  }) {
    if (fireLogin != null) {
      return fireLogin(firabaseLoginReqBodyModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FireLogin value) fireLogin,
  }) {
    return fireLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FireLogin value)? fireLogin,
  }) {
    return fireLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FireLogin value)? fireLogin,
    required TResult orElse(),
  }) {
    if (fireLogin != null) {
      return fireLogin(this);
    }
    return orElse();
  }
}

abstract class _FireLogin implements LoginEvent {
  const factory _FireLogin(
      {required final FirabaseLoginReqBodyModel
          firabaseLoginReqBodyModel}) = _$FireLoginImpl;

  @override
  FirabaseLoginReqBodyModel get firabaseLoginReqBodyModel;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FireLoginImplCopyWith<_$FireLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
