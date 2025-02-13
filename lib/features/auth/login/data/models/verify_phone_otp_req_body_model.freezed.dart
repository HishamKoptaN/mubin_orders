// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_phone_otp_req_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyPhoneOtpReqBodyModel _$VerifyPhoneOtpReqBodyModelFromJson(
    Map<String, dynamic> json) {
  return _VerifyPhoneOtpReqBodyModel.fromJson(json);
}

/// @nodoc
mixin _$VerifyPhoneOtpReqBodyModel {
  @JsonKey(name: "verificationId")
  String? get verificationId => throw _privateConstructorUsedError;
  @JsonKey(name: "otp")
  String? get otp => throw _privateConstructorUsedError;

  /// Serializes this VerifyPhoneOtpReqBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyPhoneOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyPhoneOtpReqBodyModelCopyWith<VerifyPhoneOtpReqBodyModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyPhoneOtpReqBodyModelCopyWith<$Res> {
  factory $VerifyPhoneOtpReqBodyModelCopyWith(VerifyPhoneOtpReqBodyModel value,
          $Res Function(VerifyPhoneOtpReqBodyModel) then) =
      _$VerifyPhoneOtpReqBodyModelCopyWithImpl<$Res,
          VerifyPhoneOtpReqBodyModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "verificationId") String? verificationId,
      @JsonKey(name: "otp") String? otp});
}

/// @nodoc
class _$VerifyPhoneOtpReqBodyModelCopyWithImpl<$Res,
        $Val extends VerifyPhoneOtpReqBodyModel>
    implements $VerifyPhoneOtpReqBodyModelCopyWith<$Res> {
  _$VerifyPhoneOtpReqBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyPhoneOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = freezed,
    Object? otp = freezed,
  }) {
    return _then(_value.copyWith(
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyPhoneOtpReqBodyModelImplCopyWith<$Res>
    implements $VerifyPhoneOtpReqBodyModelCopyWith<$Res> {
  factory _$$VerifyPhoneOtpReqBodyModelImplCopyWith(
          _$VerifyPhoneOtpReqBodyModelImpl value,
          $Res Function(_$VerifyPhoneOtpReqBodyModelImpl) then) =
      __$$VerifyPhoneOtpReqBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "verificationId") String? verificationId,
      @JsonKey(name: "otp") String? otp});
}

/// @nodoc
class __$$VerifyPhoneOtpReqBodyModelImplCopyWithImpl<$Res>
    extends _$VerifyPhoneOtpReqBodyModelCopyWithImpl<$Res,
        _$VerifyPhoneOtpReqBodyModelImpl>
    implements _$$VerifyPhoneOtpReqBodyModelImplCopyWith<$Res> {
  __$$VerifyPhoneOtpReqBodyModelImplCopyWithImpl(
      _$VerifyPhoneOtpReqBodyModelImpl _value,
      $Res Function(_$VerifyPhoneOtpReqBodyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyPhoneOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = freezed,
    Object? otp = freezed,
  }) {
    return _then(_$VerifyPhoneOtpReqBodyModelImpl(
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyPhoneOtpReqBodyModelImpl implements _VerifyPhoneOtpReqBodyModel {
  const _$VerifyPhoneOtpReqBodyModelImpl(
      {@JsonKey(name: "verificationId") this.verificationId,
      @JsonKey(name: "otp") this.otp});

  factory _$VerifyPhoneOtpReqBodyModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VerifyPhoneOtpReqBodyModelImplFromJson(json);

  @override
  @JsonKey(name: "verificationId")
  final String? verificationId;
  @override
  @JsonKey(name: "otp")
  final String? otp;

  @override
  String toString() {
    return 'VerifyPhoneOtpReqBodyModel(verificationId: $verificationId, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyPhoneOtpReqBodyModelImpl &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, verificationId, otp);

  /// Create a copy of VerifyPhoneOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyPhoneOtpReqBodyModelImplCopyWith<_$VerifyPhoneOtpReqBodyModelImpl>
      get copyWith => __$$VerifyPhoneOtpReqBodyModelImplCopyWithImpl<
          _$VerifyPhoneOtpReqBodyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyPhoneOtpReqBodyModelImplToJson(
      this,
    );
  }
}

abstract class _VerifyPhoneOtpReqBodyModel
    implements VerifyPhoneOtpReqBodyModel {
  const factory _VerifyPhoneOtpReqBodyModel(
          {@JsonKey(name: "verificationId") final String? verificationId,
          @JsonKey(name: "otp") final String? otp}) =
      _$VerifyPhoneOtpReqBodyModelImpl;

  factory _VerifyPhoneOtpReqBodyModel.fromJson(Map<String, dynamic> json) =
      _$VerifyPhoneOtpReqBodyModelImpl.fromJson;

  @override
  @JsonKey(name: "verificationId")
  String? get verificationId;
  @override
  @JsonKey(name: "otp")
  String? get otp;

  /// Create a copy of VerifyPhoneOtpReqBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyPhoneOtpReqBodyModelImplCopyWith<_$VerifyPhoneOtpReqBodyModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
