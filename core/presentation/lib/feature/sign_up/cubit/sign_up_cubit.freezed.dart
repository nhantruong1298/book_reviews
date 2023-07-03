// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String email, String userId) success,
    required TResult Function(AppException appException) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String email, String userId)? success,
    TResult? Function(AppException appException)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String email, String userId)? success,
    TResult Function(AppException appException)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SignUpSuccessState value) success,
    required TResult Function(SignUpExceptionState value) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpInitial value)? init,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SignUpSuccessState value)? success,
    TResult? Function(SignUpExceptionState value)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(SignUpSuccessState value)? success,
    TResult Function(SignUpExceptionState value)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SignUpInitialCopyWith<$Res> {
  factory _$$SignUpInitialCopyWith(
          _$SignUpInitial value, $Res Function(_$SignUpInitial) then) =
      __$$SignUpInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpInitialCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpInitial>
    implements _$$SignUpInitialCopyWith<$Res> {
  __$$SignUpInitialCopyWithImpl(
      _$SignUpInitial _value, $Res Function(_$SignUpInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignUpInitial implements SignUpInitial {
  const _$SignUpInitial();

  @override
  String toString() {
    return 'SignUpState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String email, String userId) success,
    required TResult Function(AppException appException) exception,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String email, String userId)? success,
    TResult? Function(AppException appException)? exception,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String email, String userId)? success,
    TResult Function(AppException appException)? exception,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SignUpSuccessState value) success,
    required TResult Function(SignUpExceptionState value) exception,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpInitial value)? init,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SignUpSuccessState value)? success,
    TResult? Function(SignUpExceptionState value)? exception,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(SignUpSuccessState value)? success,
    TResult Function(SignUpExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class SignUpInitial implements SignUpState {
  const factory SignUpInitial() = _$SignUpInitial;
}

/// @nodoc
abstract class _$$LoadingStateCopyWith<$Res> {
  factory _$$LoadingStateCopyWith(
          _$LoadingState value, $Res Function(_$LoadingState) then) =
      __$$LoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$LoadingState>
    implements _$$LoadingStateCopyWith<$Res> {
  __$$LoadingStateCopyWithImpl(
      _$LoadingState _value, $Res Function(_$LoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingState implements LoadingState {
  const _$LoadingState();

  @override
  String toString() {
    return 'SignUpState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String email, String userId) success,
    required TResult Function(AppException appException) exception,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String email, String userId)? success,
    TResult? Function(AppException appException)? exception,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String email, String userId)? success,
    TResult Function(AppException appException)? exception,
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
    required TResult Function(SignUpInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SignUpSuccessState value) success,
    required TResult Function(SignUpExceptionState value) exception,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpInitial value)? init,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SignUpSuccessState value)? success,
    TResult? Function(SignUpExceptionState value)? exception,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(SignUpSuccessState value)? success,
    TResult Function(SignUpExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements SignUpState {
  const factory LoadingState() = _$LoadingState;
}

/// @nodoc
abstract class _$$SignUpSuccessStateCopyWith<$Res> {
  factory _$$SignUpSuccessStateCopyWith(_$SignUpSuccessState value,
          $Res Function(_$SignUpSuccessState) then) =
      __$$SignUpSuccessStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String userId});
}

/// @nodoc
class __$$SignUpSuccessStateCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpSuccessState>
    implements _$$SignUpSuccessStateCopyWith<$Res> {
  __$$SignUpSuccessStateCopyWithImpl(
      _$SignUpSuccessState _value, $Res Function(_$SignUpSuccessState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? userId = null,
  }) {
    return _then(_$SignUpSuccessState(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpSuccessState implements SignUpSuccessState {
  const _$SignUpSuccessState(this.email, this.userId);

  @override
  final String email;
  @override
  final String userId;

  @override
  String toString() {
    return 'SignUpState.success(email: $email, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpSuccessState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpSuccessStateCopyWith<_$SignUpSuccessState> get copyWith =>
      __$$SignUpSuccessStateCopyWithImpl<_$SignUpSuccessState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String email, String userId) success,
    required TResult Function(AppException appException) exception,
  }) {
    return success(email, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String email, String userId)? success,
    TResult? Function(AppException appException)? exception,
  }) {
    return success?.call(email, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String email, String userId)? success,
    TResult Function(AppException appException)? exception,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(email, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SignUpSuccessState value) success,
    required TResult Function(SignUpExceptionState value) exception,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpInitial value)? init,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SignUpSuccessState value)? success,
    TResult? Function(SignUpExceptionState value)? exception,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(SignUpSuccessState value)? success,
    TResult Function(SignUpExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SignUpSuccessState implements SignUpState {
  const factory SignUpSuccessState(final String email, final String userId) =
      _$SignUpSuccessState;

  String get email;
  String get userId;
  @JsonKey(ignore: true)
  _$$SignUpSuccessStateCopyWith<_$SignUpSuccessState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpExceptionStateCopyWith<$Res> {
  factory _$$SignUpExceptionStateCopyWith(_$SignUpExceptionState value,
          $Res Function(_$SignUpExceptionState) then) =
      __$$SignUpExceptionStateCopyWithImpl<$Res>;
  @useResult
  $Res call({AppException appException});
}

/// @nodoc
class __$$SignUpExceptionStateCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpExceptionState>
    implements _$$SignUpExceptionStateCopyWith<$Res> {
  __$$SignUpExceptionStateCopyWithImpl(_$SignUpExceptionState _value,
      $Res Function(_$SignUpExceptionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appException = null,
  }) {
    return _then(_$SignUpExceptionState(
      null == appException
          ? _value.appException
          : appException // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }
}

/// @nodoc

class _$SignUpExceptionState implements SignUpExceptionState {
  const _$SignUpExceptionState(this.appException);

  @override
  final AppException appException;

  @override
  String toString() {
    return 'SignUpState.exception(appException: $appException)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpExceptionState &&
            (identical(other.appException, appException) ||
                other.appException == appException));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appException);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpExceptionStateCopyWith<_$SignUpExceptionState> get copyWith =>
      __$$SignUpExceptionStateCopyWithImpl<_$SignUpExceptionState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String email, String userId) success,
    required TResult Function(AppException appException) exception,
  }) {
    return exception(appException);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(String email, String userId)? success,
    TResult? Function(AppException appException)? exception,
  }) {
    return exception?.call(appException);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String email, String userId)? success,
    TResult Function(AppException appException)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(appException);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignUpInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(SignUpSuccessState value) success,
    required TResult Function(SignUpExceptionState value) exception,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignUpInitial value)? init,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(SignUpSuccessState value)? success,
    TResult? Function(SignUpExceptionState value)? exception,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignUpInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(SignUpSuccessState value)? success,
    TResult Function(SignUpExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class SignUpExceptionState implements SignUpState {
  const factory SignUpExceptionState(final AppException appException) =
      _$SignUpExceptionState;

  AppException get appException;
  @JsonKey(ignore: true)
  _$$SignUpExceptionStateCopyWith<_$SignUpExceptionState> get copyWith =>
      throw _privateConstructorUsedError;
}
