// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() unauthorized,
    required TResult Function(LoadUserInfoResult userInfo) authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? unauthorized,
    TResult? Function(LoadUserInfoResult userInfo)? authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? unauthorized,
    TResult Function(LoadUserInfoResult userInfo)? authorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationInitial value) init,
    required TResult Function(UnauthorizedState value) unauthorized,
    required TResult Function(AuthorizedState value) authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthenticationInitial value)? init,
    TResult? Function(UnauthorizedState value)? unauthorized,
    TResult? Function(AuthorizedState value)? authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationInitial value)? init,
    TResult Function(UnauthorizedState value)? unauthorized,
    TResult Function(AuthorizedState value)? authorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthenticationInitialCopyWith<$Res> {
  factory _$$AuthenticationInitialCopyWith(_$AuthenticationInitial value,
          $Res Function(_$AuthenticationInitial) then) =
      __$$AuthenticationInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthenticationInitialCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$AuthenticationInitial>
    implements _$$AuthenticationInitialCopyWith<$Res> {
  __$$AuthenticationInitialCopyWithImpl(_$AuthenticationInitial _value,
      $Res Function(_$AuthenticationInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthenticationInitial implements AuthenticationInitial {
  const _$AuthenticationInitial();

  @override
  String toString() {
    return 'AuthenticationState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthenticationInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() unauthorized,
    required TResult Function(LoadUserInfoResult userInfo) authorized,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? unauthorized,
    TResult? Function(LoadUserInfoResult userInfo)? authorized,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? unauthorized,
    TResult Function(LoadUserInfoResult userInfo)? authorized,
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
    required TResult Function(AuthenticationInitial value) init,
    required TResult Function(UnauthorizedState value) unauthorized,
    required TResult Function(AuthorizedState value) authorized,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthenticationInitial value)? init,
    TResult? Function(UnauthorizedState value)? unauthorized,
    TResult? Function(AuthorizedState value)? authorized,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationInitial value)? init,
    TResult Function(UnauthorizedState value)? unauthorized,
    TResult Function(AuthorizedState value)? authorized,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class AuthenticationInitial implements AuthenticationState {
  const factory AuthenticationInitial() = _$AuthenticationInitial;
}

/// @nodoc
abstract class _$$UnauthorizedStateCopyWith<$Res> {
  factory _$$UnauthorizedStateCopyWith(
          _$UnauthorizedState value, $Res Function(_$UnauthorizedState) then) =
      __$$UnauthorizedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthorizedStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$UnauthorizedState>
    implements _$$UnauthorizedStateCopyWith<$Res> {
  __$$UnauthorizedStateCopyWithImpl(
      _$UnauthorizedState _value, $Res Function(_$UnauthorizedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnauthorizedState implements UnauthorizedState {
  const _$UnauthorizedState();

  @override
  String toString() {
    return 'AuthenticationState.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthorizedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() unauthorized,
    required TResult Function(LoadUserInfoResult userInfo) authorized,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? unauthorized,
    TResult? Function(LoadUserInfoResult userInfo)? authorized,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? unauthorized,
    TResult Function(LoadUserInfoResult userInfo)? authorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationInitial value) init,
    required TResult Function(UnauthorizedState value) unauthorized,
    required TResult Function(AuthorizedState value) authorized,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthenticationInitial value)? init,
    TResult? Function(UnauthorizedState value)? unauthorized,
    TResult? Function(AuthorizedState value)? authorized,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationInitial value)? init,
    TResult Function(UnauthorizedState value)? unauthorized,
    TResult Function(AuthorizedState value)? authorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedState implements AuthenticationState {
  const factory UnauthorizedState() = _$UnauthorizedState;
}

/// @nodoc
abstract class _$$AuthorizedStateCopyWith<$Res> {
  factory _$$AuthorizedStateCopyWith(
          _$AuthorizedState value, $Res Function(_$AuthorizedState) then) =
      __$$AuthorizedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({LoadUserInfoResult userInfo});
}

/// @nodoc
class __$$AuthorizedStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$AuthorizedState>
    implements _$$AuthorizedStateCopyWith<$Res> {
  __$$AuthorizedStateCopyWithImpl(
      _$AuthorizedState _value, $Res Function(_$AuthorizedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = null,
  }) {
    return _then(_$AuthorizedState(
      null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as LoadUserInfoResult,
    ));
  }
}

/// @nodoc

class _$AuthorizedState implements AuthorizedState {
  const _$AuthorizedState(this.userInfo);

  @override
  final LoadUserInfoResult userInfo;

  @override
  String toString() {
    return 'AuthenticationState.authorized(userInfo: $userInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorizedState &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorizedStateCopyWith<_$AuthorizedState> get copyWith =>
      __$$AuthorizedStateCopyWithImpl<_$AuthorizedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() unauthorized,
    required TResult Function(LoadUserInfoResult userInfo) authorized,
  }) {
    return authorized(userInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? unauthorized,
    TResult? Function(LoadUserInfoResult userInfo)? authorized,
  }) {
    return authorized?.call(userInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? unauthorized,
    TResult Function(LoadUserInfoResult userInfo)? authorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(userInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationInitial value) init,
    required TResult Function(UnauthorizedState value) unauthorized,
    required TResult Function(AuthorizedState value) authorized,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthenticationInitial value)? init,
    TResult? Function(UnauthorizedState value)? unauthorized,
    TResult? Function(AuthorizedState value)? authorized,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationInitial value)? init,
    TResult Function(UnauthorizedState value)? unauthorized,
    TResult Function(AuthorizedState value)? authorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class AuthorizedState implements AuthenticationState {
  const factory AuthorizedState(final LoadUserInfoResult userInfo) =
      _$AuthorizedState;

  LoadUserInfoResult get userInfo;
  @JsonKey(ignore: true)
  _$$AuthorizedStateCopyWith<_$AuthorizedState> get copyWith =>
      throw _privateConstructorUsedError;
}
