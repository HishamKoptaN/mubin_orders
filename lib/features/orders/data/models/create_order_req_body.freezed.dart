// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_order_req_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateOrderReqBody _$CreateOrderReqBodyFromJson(Map<String, dynamic> json) {
  return _CreateOrderReqBody.fromJson(json);
}

/// @nodoc
mixin _$CreateOrderReqBody {
  @JsonKey(name: "content")
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "video_url")
  String? get videoUrl => throw _privateConstructorUsedError;

  /// Serializes this CreateOrderReqBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateOrderReqBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateOrderReqBodyCopyWith<CreateOrderReqBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOrderReqBodyCopyWith<$Res> {
  factory $CreateOrderReqBodyCopyWith(
          CreateOrderReqBody value, $Res Function(CreateOrderReqBody) then) =
      _$CreateOrderReqBodyCopyWithImpl<$Res, CreateOrderReqBody>;
  @useResult
  $Res call(
      {@JsonKey(name: "content") String? content,
      @JsonKey(name: "image_url") String? imageUrl,
      @JsonKey(name: "video_url") String? videoUrl});
}

/// @nodoc
class _$CreateOrderReqBodyCopyWithImpl<$Res, $Val extends CreateOrderReqBody>
    implements $CreateOrderReqBodyCopyWith<$Res> {
  _$CreateOrderReqBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateOrderReqBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? imageUrl = freezed,
    Object? videoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateOrderReqBodyImplCopyWith<$Res>
    implements $CreateOrderReqBodyCopyWith<$Res> {
  factory _$$CreateOrderReqBodyImplCopyWith(_$CreateOrderReqBodyImpl value,
          $Res Function(_$CreateOrderReqBodyImpl) then) =
      __$$CreateOrderReqBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "content") String? content,
      @JsonKey(name: "image_url") String? imageUrl,
      @JsonKey(name: "video_url") String? videoUrl});
}

/// @nodoc
class __$$CreateOrderReqBodyImplCopyWithImpl<$Res>
    extends _$CreateOrderReqBodyCopyWithImpl<$Res, _$CreateOrderReqBodyImpl>
    implements _$$CreateOrderReqBodyImplCopyWith<$Res> {
  __$$CreateOrderReqBodyImplCopyWithImpl(_$CreateOrderReqBodyImpl _value,
      $Res Function(_$CreateOrderReqBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateOrderReqBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? imageUrl = freezed,
    Object? videoUrl = freezed,
  }) {
    return _then(_$CreateOrderReqBodyImpl(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateOrderReqBodyImpl implements _CreateOrderReqBody {
  const _$CreateOrderReqBodyImpl(
      {@JsonKey(name: "content") this.content,
      @JsonKey(name: "image_url") this.imageUrl,
      @JsonKey(name: "video_url") this.videoUrl});

  factory _$CreateOrderReqBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateOrderReqBodyImplFromJson(json);

  @override
  @JsonKey(name: "content")
  final String? content;
  @override
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @override
  @JsonKey(name: "video_url")
  final String? videoUrl;

  @override
  String toString() {
    return 'CreateOrderReqBody(content: $content, imageUrl: $imageUrl, videoUrl: $videoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrderReqBodyImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content, imageUrl, videoUrl);

  /// Create a copy of CreateOrderReqBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrderReqBodyImplCopyWith<_$CreateOrderReqBodyImpl> get copyWith =>
      __$$CreateOrderReqBodyImplCopyWithImpl<_$CreateOrderReqBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateOrderReqBodyImplToJson(
      this,
    );
  }
}

abstract class _CreateOrderReqBody implements CreateOrderReqBody {
  const factory _CreateOrderReqBody(
          {@JsonKey(name: "content") final String? content,
          @JsonKey(name: "image_url") final String? imageUrl,
          @JsonKey(name: "video_url") final String? videoUrl}) =
      _$CreateOrderReqBodyImpl;

  factory _CreateOrderReqBody.fromJson(Map<String, dynamic> json) =
      _$CreateOrderReqBodyImpl.fromJson;

  @override
  @JsonKey(name: "content")
  String? get content;
  @override
  @JsonKey(name: "image_url")
  String? get imageUrl;
  @override
  @JsonKey(name: "video_url")
  String? get videoUrl;

  /// Create a copy of CreateOrderReqBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateOrderReqBodyImplCopyWith<_$CreateOrderReqBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
