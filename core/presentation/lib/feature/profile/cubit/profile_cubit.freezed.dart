// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(LoadUserInfoResult userInfo) loaded,
    required TResult Function(AppException appException) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(LoadUserInfoResult userInfo)? loaded,
    TResult? Function(AppException appException)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(LoadUserInfoResult userInfo)? loaded,
    TResult Function(AppException appException)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(ProfileLoadedState value) loaded,
    required TResult Function(ProfileExceptionState value) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial value)? init,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ProfileLoadedState value)? loaded,
    TResult? Function(ProfileExceptionState value)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(ProfileLoadedState value)? loaded,
    TResult Function(ProfileExceptionState value)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProfileInitialCopyWith<$Res> {
  factory _$$ProfileInitialCopyWith(
          _$ProfileInitial value, $Res Function(_$ProfileInitial) then) =
      __$$ProfileInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileInitialCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileInitial>
    implements _$$ProfileInitialCopyWith<$Res> {
  __$$ProfileInitialCopyWithImpl(
      _$ProfileInitial _value, $Res Function(_$ProfileInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileInitial implements ProfileInitial {
  const _$ProfileInitial();

  @override
  String toString() {
    return 'ProfileState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(LoadUserInfoResult userInfo) loaded,
    required TResult Function(AppException appException) exception,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(LoadUserInfoResult userInfo)? loaded,
    TResult? Function(AppException appException)? exception,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(LoadUserInfoResult userInfo)? loaded,
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
    required TResult Function(ProfileInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(ProfileLoadedState value) loaded,
    required TResult Function(ProfileExceptionState value) exception,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial value)? init,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ProfileLoadedState value)? loaded,
    TResult? Function(ProfileExceptionState value)? exception,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(ProfileLoadedState value)? loaded,
    TResult Function(ProfileExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class ProfileInitial implements ProfileState {
  const factory ProfileInitial() = _$ProfileInitial;
}

/// @nodoc
abstract class _$$LoadingStateCopyWith<$Res> {
  factory _$$LoadingStateCopyWith(
          _$LoadingState value, $Res Function(_$LoadingState) then) =
      __$$LoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$LoadingState>
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
    return 'ProfileState.loading()';
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
    required TResult Function(LoadUserInfoResult userInfo) loaded,
    required TResult Function(AppException appException) exception,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(LoadUserInfoResult userInfo)? loaded,
    TResult? Function(AppException appException)? exception,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(LoadUserInfoResult userInfo)? loaded,
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
    required TResult Function(ProfileInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(ProfileLoadedState value) loaded,
    required TResult Function(ProfileExceptionState value) exception,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial value)? init,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ProfileLoadedState value)? loaded,
    TResult? Function(ProfileExceptionState value)? exception,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(ProfileLoadedState value)? loaded,
    TResult Function(ProfileExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements ProfileState {
  const factory LoadingState() = _$LoadingState;
}

/// @nodoc
abstract class _$$ProfileLoadedStateCopyWith<$Res> {
  factory _$$ProfileLoadedStateCopyWith(_$ProfileLoadedState value,
          $Res Function(_$ProfileLoadedState) then) =
      __$$ProfileLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({LoadUserInfoResult userInfo});
}

/// @nodoc
class __$$ProfileLoadedStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileLoadedState>
    implements _$$ProfileLoadedStateCopyWith<$Res> {
  __$$ProfileLoadedStateCopyWithImpl(
      _$ProfileLoadedState _value, $Res Function(_$ProfileLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = null,
  }) {
    return _then(_$ProfileLoadedState(
      null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as LoadUserInfoResult,
    ));
  }
}

/// @nodoc

class _$ProfileLoadedState implements ProfileLoadedState {
  const _$ProfileLoadedState(this.userInfo);

  @override
  final LoadUserInfoResult userInfo;

  @override
  String toString() {
    return 'ProfileState.loaded(userInfo: $userInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileLoadedState &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileLoadedStateCopyWith<_$ProfileLoadedState> get copyWith =>
      __$$ProfileLoadedStateCopyWithImpl<_$ProfileLoadedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(LoadUserInfoResult userInfo) loaded,
    required TResult Function(AppException appException) exception,
  }) {
    return loaded(userInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(LoadUserInfoResult userInfo)? loaded,
    TResult? Function(AppException appException)? exception,
  }) {
    return loaded?.call(userInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(LoadUserInfoResult userInfo)? loaded,
    TResult Function(AppException appException)? exception,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(userInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(ProfileLoadedState value) loaded,
    required TResult Function(ProfileExceptionState value) exception,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial value)? init,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ProfileLoadedState value)? loaded,
    TResult? Function(ProfileExceptionState value)? exception,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(ProfileLoadedState value)? loaded,
    TResult Function(ProfileExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ProfileLoadedState implements ProfileState {
  const factory ProfileLoadedState(final LoadUserInfoResult userInfo) =
      _$ProfileLoadedState;

  LoadUserInfoResult get userInfo;
  @JsonKey(ignore: true)
  _$$ProfileLoadedStateCopyWith<_$ProfileLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileExceptionStateCopyWith<$Res> {
  factory _$$ProfileExceptionStateCopyWith(_$ProfileExceptionState value,
          $Res Function(_$ProfileExceptionState) then) =
      __$$ProfileExceptionStateCopyWithImpl<$Res>;
  @useResult
  $Res call({AppException appException});
}

/// @nodoc
class __$$ProfileExceptionStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileExceptionState>
    implements _$$ProfileExceptionStateCopyWith<$Res> {
  __$$ProfileExceptionStateCopyWithImpl(_$ProfileExceptionState _value,
      $Res Function(_$ProfileExceptionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appException = null,
  }) {
    return _then(_$ProfileExceptionState(
      null == appException
          ? _value.appException
          : appException // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }
}

/// @nodoc

class _$ProfileExceptionState implements ProfileExceptionState {
  const _$ProfileExceptionState(this.appException);

  @override
  final AppException appException;

  @override
  String toString() {
    return 'ProfileState.exception(appException: $appException)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileExceptionState &&
            (identical(other.appException, appException) ||
                other.appException == appException));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appException);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileExceptionStateCopyWith<_$ProfileExceptionState> get copyWith =>
      __$$ProfileExceptionStateCopyWithImpl<_$ProfileExceptionState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(LoadUserInfoResult userInfo) loaded,
    required TResult Function(AppException appException) exception,
  }) {
    return exception(appException);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(LoadUserInfoResult userInfo)? loaded,
    TResult? Function(AppException appException)? exception,
  }) {
    return exception?.call(appException);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(LoadUserInfoResult userInfo)? loaded,
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
    required TResult Function(ProfileInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(ProfileLoadedState value) loaded,
    required TResult Function(ProfileExceptionState value) exception,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial value)? init,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(ProfileLoadedState value)? loaded,
    TResult? Function(ProfileExceptionState value)? exception,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(ProfileLoadedState value)? loaded,
    TResult Function(ProfileExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class ProfileExceptionState implements ProfileState {
  const factory ProfileExceptionState(final AppException appException) =
      _$ProfileExceptionState;

  AppException get appException;
  @JsonKey(ignore: true)
  _$$ProfileExceptionStateCopyWith<_$ProfileExceptionState> get copyWith =>
      throw _privateConstructorUsedError;
}
