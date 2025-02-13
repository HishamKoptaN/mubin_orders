// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_phone_number_req_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyPhoneNumberReqBodyModel _$VerifyPhoneNumberReqBodyModelFromJson(
    Map<String, dynamic> json) {
  return _VerifyPhoneNumberReqBodyModel.fromJson(json);
}

/// @nodoc
mixin _$VerifyPhoneNumberReqBodyModel {
  @JsonKey(name: "phoneNumber")
  String? get phoneNumber => throw _privateConstructorUsedError;

  /// Serializes this VerifyPhoneNumberReqBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyPhoneNumberReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyPhoneNumberReqBodyModelCopyWith<VerifyPhoneNumberReqBodyModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyPhoneNumberReqBodyModelCopyWith<$Res> {
  factory $VerifyPhoneNumberReqBodyModelCopyWith(
          VerifyPhoneNumberReqBodyModel value,
          $Res Function(VerifyPhoneNumberReqBodyModel) then) =
      _$VerifyPhoneNumberReqBodyModelCopyWithImpl<$Res,
          VerifyPhoneNumberReqBodyModel>;
  @useResult
  $Res call({@JsonKey(name: "phoneNumber") String? phoneNumber});
}

/// @nodoc
class _$VerifyPhoneNumberReqBodyModelCopyWithImpl<$Res,
        $Val extends VerifyPhoneNumberReqBodyModel>
    implements $VerifyPhoneNumberReqBodyModelCopyWith<$Res> {
  _$VerifyPhoneNumberReqBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyPhoneNumberReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyPhoneNumberReqBodyModelImplCopyWith<$Res>
    implements $VerifyPhoneNumberReqBodyModelCopyWith<$Res> {
  factory _$$VerifyPhoneNumberReqBodyModelImplCopyWith(
          _$VerifyPhoneNumberReqBodyModelImpl value,
          $Res Function(_$VerifyPhoneNumberReqBodyModelImpl) then) =
      __$$VerifyPhoneNumberReqBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "phoneNumber") String? phoneNumber});
}

/// @nodoc
class __$$VerifyPhoneNumberReqBodyModelImplCopyWithImpl<$Res>
    extends _$VerifyPhoneNumberReqBodyModelCopyWithImpl<$Res,
        _$VerifyPhoneNumberReqBodyModelImpl>
    implements _$$VerifyPhoneNumberReqBodyModelImplCopyWith<$Res> {
  __$$VerifyPhoneNumberReqBodyModelImplCopyWithImpl(
      _$VerifyPhoneNumberReqBodyModelImpl _value,
      $Res Function(_$VerifyPhoneNumberReqBodyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyPhoneNumberReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(_$VerifyPhoneNumberReqBodyModelImpl(
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyPhoneNumberReqBodyModelImpl
    implements _VerifyPhoneNumberReqBodyModel {
  const _$VerifyPhoneNumberReqBodyModelImpl(
      {@JsonKey(name: "phoneNumber") this.phoneNumber});

  factory _$VerifyPhoneNumberReqBodyModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VerifyPhoneNumberReqBodyModelImplFromJson(json);

  @override
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;

  @override
  String toString() {
    return 'VerifyPhoneNumberReqBodyModel(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyPhoneNumberReqBodyModelImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  /// Create a copy of VerifyPhoneNumberReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyPhoneNumberReqBodyModelImplCopyWith<
          _$VerifyPhoneNumberReqBodyModelImpl>
      get copyWith => __$$VerifyPhoneNumberReqBodyModelImplCopyWithImpl<
          _$VerifyPhoneNumberReqBodyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyPhoneNumberReqBodyModelImplToJson(
      this,
    );
  }
}

abstract class _VerifyPhoneNumberReqBodyModel
    implements VerifyPhoneNumberReqBodyModel {
  const factory _VerifyPhoneNumberReqBodyModel(
          {@JsonKey(name: "phoneNumber") final String? phoneNumber}) =
      _$VerifyPhoneNumberReqBodyModelImpl;

  factory _VerifyPhoneNumberReqBodyModel.fromJson(Map<String, dynamic> json) =
      _$VerifyPhoneNumberReqBodyModelImpl.fromJson;

  @override
  @JsonKey(name: "phoneNumber")
  String? get phoneNumber;

  /// Create a copy of VerifyPhoneNumberReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyPhoneNumberReqBodyModelImplCopyWith<
          _$VerifyPhoneNumberReqBodyModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
