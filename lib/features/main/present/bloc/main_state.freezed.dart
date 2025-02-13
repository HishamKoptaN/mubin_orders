// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() logedIn,
    required TResult Function() firstTime,
    required TResult Function() logedOut,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logedIn,
    TResult? Function()? firstTime,
    TResult? Function()? logedOut,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logedIn,
    TResult Function()? firstTime,
    TResult Function()? logedOut,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_LogedIn value) logedIn,
    required TResult Function(_FirstTime value) firstTime,
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_LogedIn value)? logedIn,
    TResult? Function(_FirstTime value)? firstTime,
    TResult? Function(_LogedOut value)? logedOut,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_LogedIn value)? logedIn,
    TResult Function(_FirstTime value)? firstTime,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainState
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
    extends _$MainStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MainState.initial()';
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
    required TResult Function() logedIn,
    required TResult Function() firstTime,
    required TResult Function() logedOut,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logedIn,
    TResult? Function()? firstTime,
    TResult? Function()? logedOut,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logedIn,
    TResult Function()? firstTime,
    TResult Function()? logedOut,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
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
    required TResult Function(_LogedIn value) logedIn,
    required TResult Function(_FirstTime value) firstTime,
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_LogedIn value)? logedIn,
    TResult? Function(_FirstTime value)? firstTime,
    TResult? Function(_LogedOut value)? logedOut,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_LogedIn value)? logedIn,
    TResult Function(_FirstTime value)? firstTime,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MainState {
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
    extends _$MainStateCopyWithImpl<$Res, _$LoadInProgressImpl>
    implements _$$LoadInProgressImplCopyWith<$Res> {
  __$$LoadInProgressImplCopyWithImpl(
      _$LoadInProgressImpl _value, $Res Function(_$LoadInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadInProgressImpl implements _LoadInProgress {
  const _$LoadInProgressImpl();

  @override
  String toString() {
    return 'MainState.loading()';
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
    required TResult Function() logedIn,
    required TResult Function() firstTime,
    required TResult Function() logedOut,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logedIn,
    TResult? Function()? firstTime,
    TResult? Function()? logedOut,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logedIn,
    TResult Function()? firstTime,
    TResult Function()? logedOut,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
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
    required TResult Function(_LogedIn value) logedIn,
    required TResult Function(_FirstTime value) firstTime,
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_LogedIn value)? logedIn,
    TResult? Function(_FirstTime value)? firstTime,
    TResult? Function(_LogedOut value)? logedOut,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_LogedIn value)? logedIn,
    TResult Function(_FirstTime value)? firstTime,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements MainState {
  const factory _LoadInProgress() = _$LoadInProgressImpl;
}

/// @nodoc
abstract class _$$LogedInImplCopyWith<$Res> {
  factory _$$LogedInImplCopyWith(
          _$LogedInImpl value, $Res Function(_$LogedInImpl) then) =
      __$$LogedInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogedInImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$LogedInImpl>
    implements _$$LogedInImplCopyWith<$Res> {
  __$$LogedInImplCopyWithImpl(
      _$LogedInImpl _value, $Res Function(_$LogedInImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogedInImpl implements _LogedIn {
  const _$LogedInImpl();

  @override
  String toString() {
    return 'MainState.logedIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogedInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() logedIn,
    required TResult Function() firstTime,
    required TResult Function() logedOut,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) {
    return logedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logedIn,
    TResult? Function()? firstTime,
    TResult? Function()? logedOut,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) {
    return logedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logedIn,
    TResult Function()? firstTime,
    TResult Function()? logedOut,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    required TResult orElse(),
  }) {
    if (logedIn != null) {
      return logedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_LogedIn value) logedIn,
    required TResult Function(_FirstTime value) firstTime,
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_Failure value) failure,
  }) {
    return logedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_LogedIn value)? logedIn,
    TResult? Function(_FirstTime value)? firstTime,
    TResult? Function(_LogedOut value)? logedOut,
    TResult? Function(_Failure value)? failure,
  }) {
    return logedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_LogedIn value)? logedIn,
    TResult Function(_FirstTime value)? firstTime,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (logedIn != null) {
      return logedIn(this);
    }
    return orElse();
  }
}

abstract class _LogedIn implements MainState {
  const factory _LogedIn() = _$LogedInImpl;
}

/// @nodoc
abstract class _$$FirstTimeImplCopyWith<$Res> {
  factory _$$FirstTimeImplCopyWith(
          _$FirstTimeImpl value, $Res Function(_$FirstTimeImpl) then) =
      __$$FirstTimeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FirstTimeImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$FirstTimeImpl>
    implements _$$FirstTimeImplCopyWith<$Res> {
  __$$FirstTimeImplCopyWithImpl(
      _$FirstTimeImpl _value, $Res Function(_$FirstTimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FirstTimeImpl implements _FirstTime {
  const _$FirstTimeImpl();

  @override
  String toString() {
    return 'MainState.firstTime()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FirstTimeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() logedIn,
    required TResult Function() firstTime,
    required TResult Function() logedOut,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) {
    return firstTime();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logedIn,
    TResult? Function()? firstTime,
    TResult? Function()? logedOut,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) {
    return firstTime?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logedIn,
    TResult Function()? firstTime,
    TResult Function()? logedOut,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    required TResult orElse(),
  }) {
    if (firstTime != null) {
      return firstTime();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_LogedIn value) logedIn,
    required TResult Function(_FirstTime value) firstTime,
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_Failure value) failure,
  }) {
    return firstTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_LogedIn value)? logedIn,
    TResult? Function(_FirstTime value)? firstTime,
    TResult? Function(_LogedOut value)? logedOut,
    TResult? Function(_Failure value)? failure,
  }) {
    return firstTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_LogedIn value)? logedIn,
    TResult Function(_FirstTime value)? firstTime,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (firstTime != null) {
      return firstTime(this);
    }
    return orElse();
  }
}

abstract class _FirstTime implements MainState {
  const factory _FirstTime() = _$FirstTimeImpl;
}

/// @nodoc
abstract class _$$LogedOutImplCopyWith<$Res> {
  factory _$$LogedOutImplCopyWith(
          _$LogedOutImpl value, $Res Function(_$LogedOutImpl) then) =
      __$$LogedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogedOutImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$LogedOutImpl>
    implements _$$LogedOutImplCopyWith<$Res> {
  __$$LogedOutImplCopyWithImpl(
      _$LogedOutImpl _value, $Res Function(_$LogedOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogedOutImpl implements _LogedOut {
  const _$LogedOutImpl();

  @override
  String toString() {
    return 'MainState.logedOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogedOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() logedIn,
    required TResult Function() firstTime,
    required TResult Function() logedOut,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) {
    return logedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logedIn,
    TResult? Function()? firstTime,
    TResult? Function()? logedOut,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) {
    return logedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logedIn,
    TResult Function()? firstTime,
    TResult Function()? logedOut,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
    required TResult orElse(),
  }) {
    if (logedOut != null) {
      return logedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loading,
    required TResult Function(_LogedIn value) logedIn,
    required TResult Function(_FirstTime value) firstTime,
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_Failure value) failure,
  }) {
    return logedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_LogedIn value)? logedIn,
    TResult? Function(_FirstTime value)? firstTime,
    TResult? Function(_LogedOut value)? logedOut,
    TResult? Function(_Failure value)? failure,
  }) {
    return logedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_LogedIn value)? logedIn,
    TResult Function(_FirstTime value)? firstTime,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (logedOut != null) {
      return logedOut(this);
    }
    return orElse();
  }
}

abstract class _LogedOut implements MainState {
  const factory _LogedOut() = _$LogedOutImpl;
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
    extends _$MainStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainState
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
    return 'MainState.failure(apiErrorModel: $apiErrorModel)';
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

  /// Create a copy of MainState
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
    required TResult Function() logedIn,
    required TResult Function() firstTime,
    required TResult Function() logedOut,
    required TResult Function(ApiErrorModel apiErrorModel) failure,
  }) {
    return failure(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? logedIn,
    TResult? Function()? firstTime,
    TResult? Function()? logedOut,
    TResult? Function(ApiErrorModel apiErrorModel)? failure,
  }) {
    return failure?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? logedIn,
    TResult Function()? firstTime,
    TResult Function()? logedOut,
    TResult Function(ApiErrorModel apiErrorModel)? failure,
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
    required TResult Function(_LogedIn value) logedIn,
    required TResult Function(_FirstTime value) firstTime,
    required TResult Function(_LogedOut value) logedOut,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loading,
    TResult? Function(_LogedIn value)? logedIn,
    TResult? Function(_FirstTime value)? firstTime,
    TResult? Function(_LogedOut value)? logedOut,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loading,
    TResult Function(_LogedIn value)? logedIn,
    TResult Function(_FirstTime value)? firstTime,
    TResult Function(_LogedOut value)? logedOut,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements MainState {
  const factory _Failure({required final ApiErrorModel apiErrorModel}) =
      _$FailureImpl;

  ApiErrorModel get apiErrorModel;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
