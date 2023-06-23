// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isLoading) loading,
    required TResult Function(List<LoadBookResult> trendingBooks,
            List<LoadBookResult> popularBooks)
        loaded,
    required TResult Function(AppException appException) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool isLoading)? loading,
    TResult? Function(List<LoadBookResult> trendingBooks,
            List<LoadBookResult> popularBooks)?
        loaded,
    TResult? Function(AppException appException)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(List<LoadBookResult> trendingBooks,
            List<LoadBookResult> popularBooks)?
        loaded,
    TResult Function(AppException appException)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitial value) init,
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeExceptionState value) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeInitial value)? init,
    TResult? Function(HomeLoadingState value)? loading,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeExceptionState value)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitial value)? init,
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeExceptionState value)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HomeInitialCopyWith<$Res> {
  factory _$$HomeInitialCopyWith(
          _$HomeInitial value, $Res Function(_$HomeInitial) then) =
      __$$HomeInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeInitialCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeInitial>
    implements _$$HomeInitialCopyWith<$Res> {
  __$$HomeInitialCopyWithImpl(
      _$HomeInitial _value, $Res Function(_$HomeInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HomeInitial implements HomeInitial {
  const _$HomeInitial();

  @override
  String toString() {
    return 'HomeState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isLoading) loading,
    required TResult Function(List<LoadBookResult> trendingBooks,
            List<LoadBookResult> popularBooks)
        loaded,
    required TResult Function(AppException appException) exception,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool isLoading)? loading,
    TResult? Function(List<LoadBookResult> trendingBooks,
            List<LoadBookResult> popularBooks)?
        loaded,
    TResult? Function(AppException appException)? exception,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(List<LoadBookResult> trendingBooks,
            List<LoadBookResult> popularBooks)?
        loaded,
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
    required TResult Function(HomeInitial value) init,
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeExceptionState value) exception,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeInitial value)? init,
    TResult? Function(HomeLoadingState value)? loading,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeExceptionState value)? exception,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitial value)? init,
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class HomeInitial implements HomeState {
  const factory HomeInitial() = _$HomeInitial;
}

/// @nodoc
abstract class _$$HomeLoadingStateCopyWith<$Res> {
  factory _$$HomeLoadingStateCopyWith(
          _$HomeLoadingState value, $Res Function(_$HomeLoadingState) then) =
      __$$HomeLoadingStateCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$HomeLoadingStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeLoadingState>
    implements _$$HomeLoadingStateCopyWith<$Res> {
  __$$HomeLoadingStateCopyWithImpl(
      _$HomeLoadingState _value, $Res Function(_$HomeLoadingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$HomeLoadingState(
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HomeLoadingState implements HomeLoadingState {
  const _$HomeLoadingState(this.isLoading);

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'HomeState.loading(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeLoadingState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeLoadingStateCopyWith<_$HomeLoadingState> get copyWith =>
      __$$HomeLoadingStateCopyWithImpl<_$HomeLoadingState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isLoading) loading,
    required TResult Function(List<LoadBookResult> trendingBooks,
            List<LoadBookResult> popularBooks)
        loaded,
    required TResult Function(AppException appException) exception,
  }) {
    return loading(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool isLoading)? loading,
    TResult? Function(List<LoadBookResult> trendingBooks,
            List<LoadBookResult> popularBooks)?
        loaded,
    TResult? Function(AppException appException)? exception,
  }) {
    return loading?.call(isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(List<LoadBookResult> trendingBooks,
            List<LoadBookResult> popularBooks)?
        loaded,
    TResult Function(AppException appException)? exception,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitial value) init,
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeExceptionState value) exception,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeInitial value)? init,
    TResult? Function(HomeLoadingState value)? loading,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeExceptionState value)? exception,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitial value)? init,
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomeLoadingState implements HomeState {
  const factory HomeLoadingState(final bool isLoading) = _$HomeLoadingState;

  bool get isLoading;
  @JsonKey(ignore: true)
  _$$HomeLoadingStateCopyWith<_$HomeLoadingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeLoadedStateCopyWith<$Res> {
  factory _$$HomeLoadedStateCopyWith(
          _$HomeLoadedState value, $Res Function(_$HomeLoadedState) then) =
      __$$HomeLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<LoadBookResult> trendingBooks, List<LoadBookResult> popularBooks});
}

/// @nodoc
class __$$HomeLoadedStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeLoadedState>
    implements _$$HomeLoadedStateCopyWith<$Res> {
  __$$HomeLoadedStateCopyWithImpl(
      _$HomeLoadedState _value, $Res Function(_$HomeLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trendingBooks = null,
    Object? popularBooks = null,
  }) {
    return _then(_$HomeLoadedState(
      null == trendingBooks
          ? _value._trendingBooks
          : trendingBooks // ignore: cast_nullable_to_non_nullable
              as List<LoadBookResult>,
      null == popularBooks
          ? _value._popularBooks
          : popularBooks // ignore: cast_nullable_to_non_nullable
              as List<LoadBookResult>,
    ));
  }
}

/// @nodoc

class _$HomeLoadedState implements HomeLoadedState {
  const _$HomeLoadedState(final List<LoadBookResult> trendingBooks,
      final List<LoadBookResult> popularBooks)
      : _trendingBooks = trendingBooks,
        _popularBooks = popularBooks;

  final List<LoadBookResult> _trendingBooks;
  @override
  List<LoadBookResult> get trendingBooks {
    if (_trendingBooks is EqualUnmodifiableListView) return _trendingBooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingBooks);
  }

  final List<LoadBookResult> _popularBooks;
  @override
  List<LoadBookResult> get popularBooks {
    if (_popularBooks is EqualUnmodifiableListView) return _popularBooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularBooks);
  }

  @override
  String toString() {
    return 'HomeState.loaded(trendingBooks: $trendingBooks, popularBooks: $popularBooks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeLoadedState &&
            const DeepCollectionEquality()
                .equals(other._trendingBooks, _trendingBooks) &&
            const DeepCollectionEquality()
                .equals(other._popularBooks, _popularBooks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_trendingBooks),
      const DeepCollectionEquality().hash(_popularBooks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeLoadedStateCopyWith<_$HomeLoadedState> get copyWith =>
      __$$HomeLoadedStateCopyWithImpl<_$HomeLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isLoading) loading,
    required TResult Function(List<LoadBookResult> trendingBooks,
            List<LoadBookResult> popularBooks)
        loaded,
    required TResult Function(AppException appException) exception,
  }) {
    return loaded(trendingBooks, popularBooks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool isLoading)? loading,
    TResult? Function(List<LoadBookResult> trendingBooks,
            List<LoadBookResult> popularBooks)?
        loaded,
    TResult? Function(AppException appException)? exception,
  }) {
    return loaded?.call(trendingBooks, popularBooks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(List<LoadBookResult> trendingBooks,
            List<LoadBookResult> popularBooks)?
        loaded,
    TResult Function(AppException appException)? exception,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(trendingBooks, popularBooks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeInitial value) init,
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeExceptionState value) exception,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeInitial value)? init,
    TResult? Function(HomeLoadingState value)? loading,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeExceptionState value)? exception,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitial value)? init,
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class HomeLoadedState implements HomeState {
  const factory HomeLoadedState(final List<LoadBookResult> trendingBooks,
      final List<LoadBookResult> popularBooks) = _$HomeLoadedState;

  List<LoadBookResult> get trendingBooks;
  List<LoadBookResult> get popularBooks;
  @JsonKey(ignore: true)
  _$$HomeLoadedStateCopyWith<_$HomeLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeExceptionStateCopyWith<$Res> {
  factory _$$HomeExceptionStateCopyWith(_$HomeExceptionState value,
          $Res Function(_$HomeExceptionState) then) =
      __$$HomeExceptionStateCopyWithImpl<$Res>;
  @useResult
  $Res call({AppException appException});
}

/// @nodoc
class __$$HomeExceptionStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeExceptionState>
    implements _$$HomeExceptionStateCopyWith<$Res> {
  __$$HomeExceptionStateCopyWithImpl(
      _$HomeExceptionState _value, $Res Function(_$HomeExceptionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appException = null,
  }) {
    return _then(_$HomeExceptionState(
      null == appException
          ? _value.appException
          : appException // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }
}

/// @nodoc

class _$HomeExceptionState implements HomeExceptionState {
  const _$HomeExceptionState(this.appException);

  @override
  final AppException appException;

  @override
  String toString() {
    return 'HomeState.exception(appException: $appException)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeExceptionState &&
            (identical(other.appException, appException) ||
                other.appException == appException));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appException);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeExceptionStateCopyWith<_$HomeExceptionState> get copyWith =>
      __$$HomeExceptionStateCopyWithImpl<_$HomeExceptionState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(bool isLoading) loading,
    required TResult Function(List<LoadBookResult> trendingBooks,
            List<LoadBookResult> popularBooks)
        loaded,
    required TResult Function(AppException appException) exception,
  }) {
    return exception(appException);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool isLoading)? loading,
    TResult? Function(List<LoadBookResult> trendingBooks,
            List<LoadBookResult> popularBooks)?
        loaded,
    TResult? Function(AppException appException)? exception,
  }) {
    return exception?.call(appException);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool isLoading)? loading,
    TResult Function(List<LoadBookResult> trendingBooks,
            List<LoadBookResult> popularBooks)?
        loaded,
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
    required TResult Function(HomeInitial value) init,
    required TResult Function(HomeLoadingState value) loading,
    required TResult Function(HomeLoadedState value) loaded,
    required TResult Function(HomeExceptionState value) exception,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeInitial value)? init,
    TResult? Function(HomeLoadingState value)? loading,
    TResult? Function(HomeLoadedState value)? loaded,
    TResult? Function(HomeExceptionState value)? exception,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeInitial value)? init,
    TResult Function(HomeLoadingState value)? loading,
    TResult Function(HomeLoadedState value)? loaded,
    TResult Function(HomeExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class HomeExceptionState implements HomeState {
  const factory HomeExceptionState(final AppException appException) =
      _$HomeExceptionState;

  AppException get appException;
  @JsonKey(ignore: true)
  _$$HomeExceptionStateCopyWith<_$HomeExceptionState> get copyWith =>
      throw _privateConstructorUsedError;
}
