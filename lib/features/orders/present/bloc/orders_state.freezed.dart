// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrdersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)
        imagePicked,
    required TResult Function(double progress) progress,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
    required TResult Function(double progress) uploading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)?
        imagePicked,
    TResult? Function(double progress)? progress,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
    TResult? Function(double progress)? uploading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)?
        imagePicked,
    TResult Function(double progress)? progress,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    TResult Function(double progress)? uploading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_ImagePicked value) imagePicked,
    required TResult Function(_Progress value) progress,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Uploading value) uploading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_ImagePicked value)? imagePicked,
    TResult? Function(_Progress value)? progress,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Uploading value)? uploading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_ImagePicked value)? imagePicked,
    TResult Function(_Progress value)? progress,
    TResult Function(_Failure value)? failure,
    TResult Function(_Uploading value)? uploading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersStateCopyWith<$Res> {
  factory $OrdersStateCopyWith(
          OrdersState value, $Res Function(OrdersState) then) =
      _$OrdersStateCopyWithImpl<$Res, OrdersState>;
}

/// @nodoc
class _$OrdersStateCopyWithImpl<$Res, $Val extends OrdersState>
    implements $OrdersStateCopyWith<$Res> {
  _$OrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'OrdersState.initial()';
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
    required TResult Function() success,
    required TResult Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)
        imagePicked,
    required TResult Function(double progress) progress,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
    required TResult Function(double progress) uploading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)?
        imagePicked,
    TResult? Function(double progress)? progress,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
    TResult? Function(double progress)? uploading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)?
        imagePicked,
    TResult Function(double progress)? progress,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    TResult Function(double progress)? uploading,
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
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_ImagePicked value) imagePicked,
    required TResult Function(_Progress value) progress,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Uploading value) uploading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_ImagePicked value)? imagePicked,
    TResult? Function(_Progress value)? progress,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Uploading value)? uploading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_ImagePicked value)? imagePicked,
    TResult Function(_Progress value)? progress,
    TResult Function(_Failure value)? failure,
    TResult Function(_Uploading value)? uploading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OrdersState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadInProgressImplCopyWith<$Res> {
  factory _$$LoadInProgressImplCopyWith(_$LoadInProgressImpl value,
          $Res Function(_$LoadInProgressImpl) then) =
      __$$LoadInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadInProgressImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$LoadInProgressImpl>
    implements _$$LoadInProgressImplCopyWith<$Res> {
  __$$LoadInProgressImplCopyWithImpl(
      _$LoadInProgressImpl _value, $Res Function(_$LoadInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadInProgressImpl implements _LoadInProgress {
  const _$LoadInProgressImpl();

  @override
  String toString() {
    return 'OrdersState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)
        imagePicked,
    required TResult Function(double progress) progress,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
    required TResult Function(double progress) uploading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)?
        imagePicked,
    TResult? Function(double progress)? progress,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
    TResult? Function(double progress)? uploading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)?
        imagePicked,
    TResult Function(double progress)? progress,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    TResult Function(double progress)? uploading,
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
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_ImagePicked value) imagePicked,
    required TResult Function(_Progress value) progress,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Uploading value) uploading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_ImagePicked value)? imagePicked,
    TResult? Function(_Progress value)? progress,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Uploading value)? uploading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_ImagePicked value)? imagePicked,
    TResult Function(_Progress value)? progress,
    TResult Function(_Failure value)? failure,
    TResult Function(_Uploading value)? uploading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements OrdersState {
  const factory _LoadInProgress() = _$LoadInProgressImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'OrdersState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)
        imagePicked,
    required TResult Function(double progress) progress,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
    required TResult Function(double progress) uploading,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)?
        imagePicked,
    TResult? Function(double progress)? progress,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
    TResult? Function(double progress)? uploading,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)?
        imagePicked,
    TResult Function(double progress)? progress,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    TResult Function(double progress)? uploading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_ImagePicked value) imagePicked,
    required TResult Function(_Progress value) progress,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Uploading value) uploading,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_ImagePicked value)? imagePicked,
    TResult? Function(_Progress value)? progress,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Uploading value)? uploading,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_ImagePicked value)? imagePicked,
    TResult Function(_Progress value)? progress,
    TResult Function(_Failure value)? failure,
    TResult Function(_Uploading value)? uploading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements OrdersState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$ImagePickedImplCopyWith<$Res> {
  factory _$$ImagePickedImplCopyWith(
          _$ImagePickedImpl value, $Res Function(_$ImagePickedImpl) then) =
      __$$ImagePickedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile file, FileType fileType, ImageSelection? imageSelection});
}

/// @nodoc
class __$$ImagePickedImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$ImagePickedImpl>
    implements _$$ImagePickedImplCopyWith<$Res> {
  __$$ImagePickedImplCopyWithImpl(
      _$ImagePickedImpl _value, $Res Function(_$ImagePickedImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? fileType = null,
    Object? imageSelection = freezed,
  }) {
    return _then(_$ImagePickedImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as FileType,
      imageSelection: freezed == imageSelection
          ? _value.imageSelection
          : imageSelection // ignore: cast_nullable_to_non_nullable
              as ImageSelection?,
    ));
  }
}

/// @nodoc

class _$ImagePickedImpl implements _ImagePicked {
  const _$ImagePickedImpl(
      {required this.file, required this.fileType, this.imageSelection});

  @override
  final XFile file;
  @override
  final FileType fileType;
  @override
  final ImageSelection? imageSelection;

  @override
  String toString() {
    return 'OrdersState.imagePicked(file: $file, fileType: $fileType, imageSelection: $imageSelection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagePickedImpl &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.imageSelection, imageSelection) ||
                other.imageSelection == imageSelection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file, fileType, imageSelection);

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagePickedImplCopyWith<_$ImagePickedImpl> get copyWith =>
      __$$ImagePickedImplCopyWithImpl<_$ImagePickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)
        imagePicked,
    required TResult Function(double progress) progress,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
    required TResult Function(double progress) uploading,
  }) {
    return imagePicked(file, fileType, imageSelection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)?
        imagePicked,
    TResult? Function(double progress)? progress,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
    TResult? Function(double progress)? uploading,
  }) {
    return imagePicked?.call(file, fileType, imageSelection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)?
        imagePicked,
    TResult Function(double progress)? progress,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    TResult Function(double progress)? uploading,
    required TResult orElse(),
  }) {
    if (imagePicked != null) {
      return imagePicked(file, fileType, imageSelection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_ImagePicked value) imagePicked,
    required TResult Function(_Progress value) progress,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Uploading value) uploading,
  }) {
    return imagePicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_ImagePicked value)? imagePicked,
    TResult? Function(_Progress value)? progress,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Uploading value)? uploading,
  }) {
    return imagePicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_ImagePicked value)? imagePicked,
    TResult Function(_Progress value)? progress,
    TResult Function(_Failure value)? failure,
    TResult Function(_Uploading value)? uploading,
    required TResult orElse(),
  }) {
    if (imagePicked != null) {
      return imagePicked(this);
    }
    return orElse();
  }
}

abstract class _ImagePicked implements OrdersState {
  const factory _ImagePicked(
      {required final XFile file,
      required final FileType fileType,
      final ImageSelection? imageSelection}) = _$ImagePickedImpl;

  XFile get file;
  FileType get fileType;
  ImageSelection? get imageSelection;

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImagePickedImplCopyWith<_$ImagePickedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProgressImplCopyWith<$Res> {
  factory _$$ProgressImplCopyWith(
          _$ProgressImpl value, $Res Function(_$ProgressImpl) then) =
      __$$ProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double progress});
}

/// @nodoc
class __$$ProgressImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$ProgressImpl>
    implements _$$ProgressImplCopyWith<$Res> {
  __$$ProgressImplCopyWithImpl(
      _$ProgressImpl _value, $Res Function(_$ProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
  }) {
    return _then(_$ProgressImpl(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ProgressImpl implements _Progress {
  const _$ProgressImpl({required this.progress});

  @override
  final double progress;

  @override
  String toString() {
    return 'OrdersState.progress(progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress);

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressImplCopyWith<_$ProgressImpl> get copyWith =>
      __$$ProgressImplCopyWithImpl<_$ProgressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)
        imagePicked,
    required TResult Function(double progress) progress,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
    required TResult Function(double progress) uploading,
  }) {
    return progress(this.progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)?
        imagePicked,
    TResult? Function(double progress)? progress,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
    TResult? Function(double progress)? uploading,
  }) {
    return progress?.call(this.progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)?
        imagePicked,
    TResult Function(double progress)? progress,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    TResult Function(double progress)? uploading,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this.progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_ImagePicked value) imagePicked,
    required TResult Function(_Progress value) progress,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Uploading value) uploading,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_ImagePicked value)? imagePicked,
    TResult? Function(_Progress value)? progress,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Uploading value)? uploading,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_ImagePicked value)? imagePicked,
    TResult Function(_Progress value)? progress,
    TResult Function(_Failure value)? failure,
    TResult Function(_Uploading value)? uploading,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class _Progress implements OrdersState {
  const factory _Progress({required final double progress}) = _$ProgressImpl;

  double get progress;

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgressImplCopyWith<_$ProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiErrorModel = null,
  }) {
    return _then(_$FailureImpl(
      apiErrorModel: null == apiErrorModel
          ? _value.apiErrorModel
          : apiErrorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl({required this.apiErrorModel});

  @override
  final ApiErrorModel apiErrorModel;

  @override
  String toString() {
    return 'OrdersState.failure(apiErrorModel: $apiErrorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)
        imagePicked,
    required TResult Function(double progress) progress,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
    required TResult Function(double progress) uploading,
  }) {
    return failure(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)?
        imagePicked,
    TResult? Function(double progress)? progress,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
    TResult? Function(double progress)? uploading,
  }) {
    return failure?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)?
        imagePicked,
    TResult Function(double progress)? progress,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    TResult Function(double progress)? uploading,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(apiErrorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_ImagePicked value) imagePicked,
    required TResult Function(_Progress value) progress,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Uploading value) uploading,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_ImagePicked value)? imagePicked,
    TResult? Function(_Progress value)? progress,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Uploading value)? uploading,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_ImagePicked value)? imagePicked,
    TResult Function(_Progress value)? progress,
    TResult Function(_Failure value)? failure,
    TResult Function(_Uploading value)? uploading,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements OrdersState {
  const factory _Failure({required final ApiErrorModel apiErrorModel}) =
      _$FailureImpl;

  ApiErrorModel get apiErrorModel;

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadingImplCopyWith<$Res> {
  factory _$$UploadingImplCopyWith(
          _$UploadingImpl value, $Res Function(_$UploadingImpl) then) =
      __$$UploadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double progress});
}

/// @nodoc
class __$$UploadingImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$UploadingImpl>
    implements _$$UploadingImplCopyWith<$Res> {
  __$$UploadingImplCopyWithImpl(
      _$UploadingImpl _value, $Res Function(_$UploadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
  }) {
    return _then(_$UploadingImpl(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$UploadingImpl implements _Uploading {
  const _$UploadingImpl({required this.progress});

  @override
  final double progress;

  @override
  String toString() {
    return 'OrdersState.uploading(progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadingImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress);

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadingImplCopyWith<_$UploadingImpl> get copyWith =>
      __$$UploadingImplCopyWithImpl<_$UploadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)
        imagePicked,
    required TResult Function(double progress) progress,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
    required TResult Function(double progress) uploading,
  }) {
    return uploading(this.progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)?
        imagePicked,
    TResult? Function(double progress)? progress,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
    TResult? Function(double progress)? uploading,
  }) {
    return uploading?.call(this.progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(
            XFile file, FileType fileType, ImageSelection? imageSelection)?
        imagePicked,
    TResult Function(double progress)? progress,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    TResult Function(double progress)? uploading,
    required TResult orElse(),
  }) {
    if (uploading != null) {
      return uploading(this.progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_ImagePicked value) imagePicked,
    required TResult Function(_Progress value) progress,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Uploading value) uploading,
  }) {
    return uploading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_ImagePicked value)? imagePicked,
    TResult? Function(_Progress value)? progress,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Uploading value)? uploading,
  }) {
    return uploading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_ImagePicked value)? imagePicked,
    TResult Function(_Progress value)? progress,
    TResult Function(_Failure value)? failure,
    TResult Function(_Uploading value)? uploading,
    required TResult orElse(),
  }) {
    if (uploading != null) {
      return uploading(this);
    }
    return orElse();
  }
}

abstract class _Uploading implements OrdersState {
  const factory _Uploading({required final double progress}) = _$UploadingImpl;

  double get progress;

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadingImplCopyWith<_$UploadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
