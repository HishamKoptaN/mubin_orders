// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_req_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginReqBodyModel _$LoginReqBodyModelFromJson(Map<String, dynamic> json) {
  return _LoginReqBodyModel.fromJson(json);
}

/// @nodoc
mixin _$LoginReqBodyModel {
  @JsonKey(name: "id_token")
  String? get idToken => throw _privateConstructorUsedError;

  /// Serializes this LoginReqBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginReqBodyModelCopyWith<LoginReqBodyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginReqBodyModelCopyWith<$Res> {
  factory $LoginReqBodyModelCopyWith(
          LoginReqBodyModel value, $Res Function(LoginReqBodyModel) then) =
      _$LoginReqBodyModelCopyWithImpl<$Res, LoginReqBodyModel>;
  @useResult
  $Res call({@JsonKey(name: "id_token") String? idToken});
}

/// @nodoc
class _$LoginReqBodyModelCopyWithImpl<$Res, $Val extends LoginReqBodyModel>
    implements $LoginReqBodyModelCopyWith<$Res> {
  _$LoginReqBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = freezed,
  }) {
    return _then(_value.copyWith(
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginReqBodyModelImplCopyWith<$Res>
    implements $LoginReqBodyModelCopyWith<$Res> {
  factory _$$LoginReqBodyModelImplCopyWith(_$LoginReqBodyModelImpl value,
          $Res Function(_$LoginReqBodyModelImpl) then) =
      __$$LoginReqBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "id_token") String? idToken});
}

/// @nodoc
class __$$LoginReqBodyModelImplCopyWithImpl<$Res>
    extends _$LoginReqBodyModelCopyWithImpl<$Res, _$LoginReqBodyModelImpl>
    implements _$$LoginReqBodyModelImplCopyWith<$Res> {
  __$$LoginReqBodyModelImplCopyWithImpl(_$LoginReqBodyModelImpl _value,
      $Res Function(_$LoginReqBodyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = freezed,
  }) {
    return _then(_$LoginReqBodyModelImpl(
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginReqBodyModelImpl implements _LoginReqBodyModel {
  const _$LoginReqBodyModelImpl({@JsonKey(name: "id_token") this.idToken});

  factory _$LoginReqBodyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginReqBodyModelImplFromJson(json);

  @override
  @JsonKey(name: "id_token")
  final String? idToken;

  @override
  String toString() {
    return 'LoginReqBodyModel(idToken: $idToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginReqBodyModelImpl &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idToken);

  /// Create a copy of LoginReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginReqBodyModelImplCopyWith<_$LoginReqBodyModelImpl> get copyWith =>
      __$$LoginReqBodyModelImplCopyWithImpl<_$LoginReqBodyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginReqBodyModelImplToJson(
      this,
    );
  }
}

abstract class _LoginReqBodyModel implements LoginReqBodyModel {
  const factory _LoginReqBodyModel(
          {@JsonKey(name: "id_token") final String? idToken}) =
      _$LoginReqBodyModelImpl;

  factory _LoginReqBodyModel.fromJson(Map<String, dynamic> json) =
      _$LoginReqBodyModelImpl.fromJson;

  @override
  @JsonKey(name: "id_token")
  String? get idToken;

  /// Create a copy of LoginReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginReqBodyModelImplCopyWith<_$LoginReqBodyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
