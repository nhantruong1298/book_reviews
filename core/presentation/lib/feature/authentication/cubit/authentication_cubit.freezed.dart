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
    required TResult Function(UserCredential userCredential) firebase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(UserCredential userCredential)? firebase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserCredential userCredential)? firebase,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationInitial value) init,
    required TResult Function(AuthenticationFirebaseState value) firebase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthenticationInitial value)? init,
    TResult? Function(AuthenticationFirebaseState value)? firebase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationInitial value)? init,
    TResult Function(AuthenticationFirebaseState value)? firebase,
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
    required TResult Function(UserCredential userCredential) firebase,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(UserCredential userCredential)? firebase,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserCredential userCredential)? firebase,
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
    required TResult Function(AuthenticationFirebaseState value) firebase,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthenticationInitial value)? init,
    TResult? Function(AuthenticationFirebaseState value)? firebase,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationInitial value)? init,
    TResult Function(AuthenticationFirebaseState value)? firebase,
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
abstract class _$$AuthenticationFirebaseStateCopyWith<$Res> {
  factory _$$AuthenticationFirebaseStateCopyWith(
          _$AuthenticationFirebaseState value,
          $Res Function(_$AuthenticationFirebaseState) then) =
      __$$AuthenticationFirebaseStateCopyWithImpl<$Res>;
  @useResult
  $Res call({UserCredential userCredential});
}

/// @nodoc
class __$$AuthenticationFirebaseStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res,
        _$AuthenticationFirebaseState>
    implements _$$AuthenticationFirebaseStateCopyWith<$Res> {
  __$$AuthenticationFirebaseStateCopyWithImpl(
      _$AuthenticationFirebaseState _value,
      $Res Function(_$AuthenticationFirebaseState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCredential = null,
  }) {
    return _then(_$AuthenticationFirebaseState(
      null == userCredential
          ? _value.userCredential
          : userCredential // ignore: cast_nullable_to_non_nullable
              as UserCredential,
    ));
  }
}

/// @nodoc

class _$AuthenticationFirebaseState implements AuthenticationFirebaseState {
  const _$AuthenticationFirebaseState(this.userCredential);

  @override
  final UserCredential userCredential;

  @override
  String toString() {
    return 'AuthenticationState.firebase(userCredential: $userCredential)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationFirebaseState &&
            (identical(other.userCredential, userCredential) ||
                other.userCredential == userCredential));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userCredential);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationFirebaseStateCopyWith<_$AuthenticationFirebaseState>
      get copyWith => __$$AuthenticationFirebaseStateCopyWithImpl<
          _$AuthenticationFirebaseState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(UserCredential userCredential) firebase,
  }) {
    return firebase(userCredential);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(UserCredential userCredential)? firebase,
  }) {
    return firebase?.call(userCredential);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(UserCredential userCredential)? firebase,
    required TResult orElse(),
  }) {
    if (firebase != null) {
      return firebase(userCredential);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationInitial value) init,
    required TResult Function(AuthenticationFirebaseState value) firebase,
  }) {
    return firebase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthenticationInitial value)? init,
    TResult? Function(AuthenticationFirebaseState value)? firebase,
  }) {
    return firebase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationInitial value)? init,
    TResult Function(AuthenticationFirebaseState value)? firebase,
    required TResult orElse(),
  }) {
    if (firebase != null) {
      return firebase(this);
    }
    return orElse();
  }
}

abstract class AuthenticationFirebaseState implements AuthenticationState {
  const factory AuthenticationFirebaseState(
      final UserCredential userCredential) = _$AuthenticationFirebaseState;

  UserCredential get userCredential;
  @JsonKey(ignore: true)
  _$$AuthenticationFirebaseStateCopyWith<_$AuthenticationFirebaseState>
      get copyWith => throw _privateConstructorUsedError;
}
