// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginResModel _$LoginResModelFromJson(Map<String, dynamic> json) {
  return _LoginResModel.fromJson(json);
}

/// @nodoc
mixin _$LoginResModel {
  @JsonKey(name: "token")
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: "role")
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(name: "additional_data")
  dynamic get additionalData => throw _privateConstructorUsedError;

  /// Serializes this LoginResModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginResModelCopyWith<LoginResModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResModelCopyWith<$Res> {
  factory $LoginResModelCopyWith(
          LoginResModel value, $Res Function(LoginResModel) then) =
      _$LoginResModelCopyWithImpl<$Res, LoginResModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "token") String? token,
      @JsonKey(name: "role") String? role,
      @JsonKey(name: "additional_data") dynamic additionalData});
}

/// @nodoc
class _$LoginResModelCopyWithImpl<$Res, $Val extends LoginResModel>
    implements $LoginResModelCopyWith<$Res> {
  _$LoginResModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? role = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginResModelImplCopyWith<$Res>
    implements $LoginResModelCopyWith<$Res> {
  factory _$$LoginResModelImplCopyWith(
          _$LoginResModelImpl value, $Res Function(_$LoginResModelImpl) then) =
      __$$LoginResModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "token") String? token,
      @JsonKey(name: "role") String? role,
      @JsonKey(name: "additional_data") dynamic additionalData});
}

/// @nodoc
class __$$LoginResModelImplCopyWithImpl<$Res>
    extends _$LoginResModelCopyWithImpl<$Res, _$LoginResModelImpl>
    implements _$$LoginResModelImplCopyWith<$Res> {
  __$$LoginResModelImplCopyWithImpl(
      _$LoginResModelImpl _value, $Res Function(_$LoginResModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginResModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? role = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(_$LoginResModelImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResModelImpl implements _LoginResModel {
  const _$LoginResModelImpl(
      {@JsonKey(name: "token") this.token,
      @JsonKey(name: "role") this.role,
      @JsonKey(name: "additional_data") this.additionalData});

  factory _$LoginResModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResModelImplFromJson(json);

  @override
  @JsonKey(name: "token")
  final String? token;
  @override
  @JsonKey(name: "role")
  final String? role;
  @override
  @JsonKey(name: "additional_data")
  final dynamic additionalData;

  @override
  String toString() {
    return 'LoginResModel(token: $token, role: $role, additionalData: $additionalData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality()
                .equals(other.additionalData, additionalData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, role,
      const DeepCollectionEquality().hash(additionalData));

  /// Create a copy of LoginResModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResModelImplCopyWith<_$LoginResModelImpl> get copyWith =>
      __$$LoginResModelImplCopyWithImpl<_$LoginResModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResModelImplToJson(
      this,
    );
  }
}

abstract class _LoginResModel implements LoginResModel {
  const factory _LoginResModel(
          {@JsonKey(name: "token") final String? token,
          @JsonKey(name: "role") final String? role,
          @JsonKey(name: "additional_data") final dynamic additionalData}) =
      _$LoginResModelImpl;

  factory _LoginResModel.fromJson(Map<String, dynamic> json) =
      _$LoginResModelImpl.fromJson;

  @override
  @JsonKey(name: "token")
  String? get token;
  @override
  @JsonKey(name: "role")
  String? get role;
  @override
  @JsonKey(name: "additional_data")
  dynamic get additionalData;

  /// Create a copy of LoginResModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginResModelImplCopyWith<_$LoginResModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
