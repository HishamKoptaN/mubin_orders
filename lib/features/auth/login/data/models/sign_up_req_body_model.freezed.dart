// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_req_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignUpReqBodyModel _$SignUpReqBodyModelFromJson(Map<String, dynamic> json) {
  return _SignUpReqBodyModel.fromJson(json);
}

/// @nodoc
mixin _$SignUpReqBodyModel {
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "password")
  String? get password => throw _privateConstructorUsedError;

  /// Serializes this SignUpReqBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignUpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpReqBodyModelCopyWith<SignUpReqBodyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpReqBodyModelCopyWith<$Res> {
  factory $SignUpReqBodyModelCopyWith(
          SignUpReqBodyModel value, $Res Function(SignUpReqBodyModel) then) =
      _$SignUpReqBodyModelCopyWithImpl<$Res, SignUpReqBodyModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "email") String? email,
      @JsonKey(name: "password") String? password});
}

/// @nodoc
class _$SignUpReqBodyModelCopyWithImpl<$Res, $Val extends SignUpReqBodyModel>
    implements $SignUpReqBodyModelCopyWith<$Res> {
  _$SignUpReqBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpReqBodyModelImplCopyWith<$Res>
    implements $SignUpReqBodyModelCopyWith<$Res> {
  factory _$$SignUpReqBodyModelImplCopyWith(_$SignUpReqBodyModelImpl value,
          $Res Function(_$SignUpReqBodyModelImpl) then) =
      __$$SignUpReqBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "email") String? email,
      @JsonKey(name: "password") String? password});
}

/// @nodoc
class __$$SignUpReqBodyModelImplCopyWithImpl<$Res>
    extends _$SignUpReqBodyModelCopyWithImpl<$Res, _$SignUpReqBodyModelImpl>
    implements _$$SignUpReqBodyModelImplCopyWith<$Res> {
  __$$SignUpReqBodyModelImplCopyWithImpl(_$SignUpReqBodyModelImpl _value,
      $Res Function(_$SignUpReqBodyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$SignUpReqBodyModelImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpReqBodyModelImpl implements _SignUpReqBodyModel {
  const _$SignUpReqBodyModelImpl(
      {@JsonKey(name: "email") this.email,
      @JsonKey(name: "password") this.password});

  factory _$SignUpReqBodyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpReqBodyModelImplFromJson(json);

  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "password")
  final String? password;

  @override
  String toString() {
    return 'SignUpReqBodyModel(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpReqBodyModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of SignUpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpReqBodyModelImplCopyWith<_$SignUpReqBodyModelImpl> get copyWith =>
      __$$SignUpReqBodyModelImplCopyWithImpl<_$SignUpReqBodyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpReqBodyModelImplToJson(
      this,
    );
  }
}

abstract class _SignUpReqBodyModel implements SignUpReqBodyModel {
  const factory _SignUpReqBodyModel(
          {@JsonKey(name: "email") final String? email,
          @JsonKey(name: "password") final String? password}) =
      _$SignUpReqBodyModelImpl;

  factory _SignUpReqBodyModel.fromJson(Map<String, dynamic> json) =
      _$SignUpReqBodyModelImpl.fromJson;

  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "password")
  String? get password;

  /// Create a copy of SignUpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpReqBodyModelImplCopyWith<_$SignUpReqBodyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
