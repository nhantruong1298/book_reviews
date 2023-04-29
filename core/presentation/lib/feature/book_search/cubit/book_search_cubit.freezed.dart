// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookSearchState {
  BookSearchData? get searchData => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookSearchData? searchData) init,
    required TResult Function(BookSearchData? searchData, bool isLoading)
        loading,
    required TResult Function(
            BookSearchData? searchData, List<BookDetailResponse> data)
        loaded,
    required TResult Function(
            BookSearchData? searchData, AppException appException)
        exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookSearchData? searchData)? init,
    TResult? Function(BookSearchData? searchData, bool isLoading)? loading,
    TResult? Function(
            BookSearchData? searchData, List<BookDetailResponse> data)?
        loaded,
    TResult? Function(BookSearchData? searchData, AppException appException)?
        exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookSearchData? searchData)? init,
    TResult Function(BookSearchData? searchData, bool isLoading)? loading,
    TResult Function(BookSearchData? searchData, List<BookDetailResponse> data)?
        loaded,
    TResult Function(BookSearchData? searchData, AppException appException)?
        exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookSearchInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(BookSearchLoadedState value) loaded,
    required TResult Function(BookSearchExceptionState value) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BookSearchInitial value)? init,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(BookSearchLoadedState value)? loaded,
    TResult? Function(BookSearchExceptionState value)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookSearchInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(BookSearchLoadedState value)? loaded,
    TResult Function(BookSearchExceptionState value)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookSearchStateCopyWith<BookSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookSearchStateCopyWith<$Res> {
  factory $BookSearchStateCopyWith(
          BookSearchState value, $Res Function(BookSearchState) then) =
      _$BookSearchStateCopyWithImpl<$Res, BookSearchState>;
  @useResult
  $Res call({BookSearchData? searchData});
}

/// @nodoc
class _$BookSearchStateCopyWithImpl<$Res, $Val extends BookSearchState>
    implements $BookSearchStateCopyWith<$Res> {
  _$BookSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchData = freezed,
  }) {
    return _then(_value.copyWith(
      searchData: freezed == searchData
          ? _value.searchData
          : searchData // ignore: cast_nullable_to_non_nullable
              as BookSearchData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookSearchInitialCopyWith<$Res>
    implements $BookSearchStateCopyWith<$Res> {
  factory _$$BookSearchInitialCopyWith(
          _$BookSearchInitial value, $Res Function(_$BookSearchInitial) then) =
      __$$BookSearchInitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookSearchData? searchData});
}

/// @nodoc
class __$$BookSearchInitialCopyWithImpl<$Res>
    extends _$BookSearchStateCopyWithImpl<$Res, _$BookSearchInitial>
    implements _$$BookSearchInitialCopyWith<$Res> {
  __$$BookSearchInitialCopyWithImpl(
      _$BookSearchInitial _value, $Res Function(_$BookSearchInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchData = freezed,
  }) {
    return _then(_$BookSearchInitial(
      freezed == searchData
          ? _value.searchData
          : searchData // ignore: cast_nullable_to_non_nullable
              as BookSearchData?,
    ));
  }
}

/// @nodoc

class _$BookSearchInitial implements BookSearchInitial {
  const _$BookSearchInitial(this.searchData);

  @override
  final BookSearchData? searchData;

  @override
  String toString() {
    return 'BookSearchState.init(searchData: $searchData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookSearchInitial &&
            (identical(other.searchData, searchData) ||
                other.searchData == searchData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookSearchInitialCopyWith<_$BookSearchInitial> get copyWith =>
      __$$BookSearchInitialCopyWithImpl<_$BookSearchInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookSearchData? searchData) init,
    required TResult Function(BookSearchData? searchData, bool isLoading)
        loading,
    required TResult Function(
            BookSearchData? searchData, List<BookDetailResponse> data)
        loaded,
    required TResult Function(
            BookSearchData? searchData, AppException appException)
        exception,
  }) {
    return init(searchData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookSearchData? searchData)? init,
    TResult? Function(BookSearchData? searchData, bool isLoading)? loading,
    TResult? Function(
            BookSearchData? searchData, List<BookDetailResponse> data)?
        loaded,
    TResult? Function(BookSearchData? searchData, AppException appException)?
        exception,
  }) {
    return init?.call(searchData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookSearchData? searchData)? init,
    TResult Function(BookSearchData? searchData, bool isLoading)? loading,
    TResult Function(BookSearchData? searchData, List<BookDetailResponse> data)?
        loaded,
    TResult Function(BookSearchData? searchData, AppException appException)?
        exception,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(searchData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookSearchInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(BookSearchLoadedState value) loaded,
    required TResult Function(BookSearchExceptionState value) exception,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BookSearchInitial value)? init,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(BookSearchLoadedState value)? loaded,
    TResult? Function(BookSearchExceptionState value)? exception,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookSearchInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(BookSearchLoadedState value)? loaded,
    TResult Function(BookSearchExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class BookSearchInitial implements BookSearchState {
  const factory BookSearchInitial(final BookSearchData? searchData) =
      _$BookSearchInitial;

  @override
  BookSearchData? get searchData;
  @override
  @JsonKey(ignore: true)
  _$$BookSearchInitialCopyWith<_$BookSearchInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingStateCopyWith<$Res>
    implements $BookSearchStateCopyWith<$Res> {
  factory _$$LoadingStateCopyWith(
          _$LoadingState value, $Res Function(_$LoadingState) then) =
      __$$LoadingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookSearchData? searchData, bool isLoading});
}

/// @nodoc
class __$$LoadingStateCopyWithImpl<$Res>
    extends _$BookSearchStateCopyWithImpl<$Res, _$LoadingState>
    implements _$$LoadingStateCopyWith<$Res> {
  __$$LoadingStateCopyWithImpl(
      _$LoadingState _value, $Res Function(_$LoadingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchData = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$LoadingState(
      freezed == searchData
          ? _value.searchData
          : searchData // ignore: cast_nullable_to_non_nullable
              as BookSearchData?,
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadingState implements LoadingState {
  const _$LoadingState(this.searchData, this.isLoading);

  @override
  final BookSearchData? searchData;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'BookSearchState.loading(searchData: $searchData, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingState &&
            (identical(other.searchData, searchData) ||
                other.searchData == searchData) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchData, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingStateCopyWith<_$LoadingState> get copyWith =>
      __$$LoadingStateCopyWithImpl<_$LoadingState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookSearchData? searchData) init,
    required TResult Function(BookSearchData? searchData, bool isLoading)
        loading,
    required TResult Function(
            BookSearchData? searchData, List<BookDetailResponse> data)
        loaded,
    required TResult Function(
            BookSearchData? searchData, AppException appException)
        exception,
  }) {
    return loading(searchData, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookSearchData? searchData)? init,
    TResult? Function(BookSearchData? searchData, bool isLoading)? loading,
    TResult? Function(
            BookSearchData? searchData, List<BookDetailResponse> data)?
        loaded,
    TResult? Function(BookSearchData? searchData, AppException appException)?
        exception,
  }) {
    return loading?.call(searchData, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookSearchData? searchData)? init,
    TResult Function(BookSearchData? searchData, bool isLoading)? loading,
    TResult Function(BookSearchData? searchData, List<BookDetailResponse> data)?
        loaded,
    TResult Function(BookSearchData? searchData, AppException appException)?
        exception,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(searchData, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookSearchInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(BookSearchLoadedState value) loaded,
    required TResult Function(BookSearchExceptionState value) exception,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BookSearchInitial value)? init,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(BookSearchLoadedState value)? loaded,
    TResult? Function(BookSearchExceptionState value)? exception,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookSearchInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(BookSearchLoadedState value)? loaded,
    TResult Function(BookSearchExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements BookSearchState {
  const factory LoadingState(
      final BookSearchData? searchData, final bool isLoading) = _$LoadingState;

  @override
  BookSearchData? get searchData;
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$LoadingStateCopyWith<_$LoadingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookSearchLoadedStateCopyWith<$Res>
    implements $BookSearchStateCopyWith<$Res> {
  factory _$$BookSearchLoadedStateCopyWith(_$BookSearchLoadedState value,
          $Res Function(_$BookSearchLoadedState) then) =
      __$$BookSearchLoadedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookSearchData? searchData, List<BookDetailResponse> data});
}

/// @nodoc
class __$$BookSearchLoadedStateCopyWithImpl<$Res>
    extends _$BookSearchStateCopyWithImpl<$Res, _$BookSearchLoadedState>
    implements _$$BookSearchLoadedStateCopyWith<$Res> {
  __$$BookSearchLoadedStateCopyWithImpl(_$BookSearchLoadedState _value,
      $Res Function(_$BookSearchLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchData = freezed,
    Object? data = null,
  }) {
    return _then(_$BookSearchLoadedState(
      freezed == searchData
          ? _value.searchData
          : searchData // ignore: cast_nullable_to_non_nullable
              as BookSearchData?,
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BookDetailResponse>,
    ));
  }
}

/// @nodoc

class _$BookSearchLoadedState implements BookSearchLoadedState {
  const _$BookSearchLoadedState(
      this.searchData, final List<BookDetailResponse> data)
      : _data = data;

  @override
  final BookSearchData? searchData;
  final List<BookDetailResponse> _data;
  @override
  List<BookDetailResponse> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'BookSearchState.loaded(searchData: $searchData, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookSearchLoadedState &&
            (identical(other.searchData, searchData) ||
                other.searchData == searchData) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, searchData, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookSearchLoadedStateCopyWith<_$BookSearchLoadedState> get copyWith =>
      __$$BookSearchLoadedStateCopyWithImpl<_$BookSearchLoadedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookSearchData? searchData) init,
    required TResult Function(BookSearchData? searchData, bool isLoading)
        loading,
    required TResult Function(
            BookSearchData? searchData, List<BookDetailResponse> data)
        loaded,
    required TResult Function(
            BookSearchData? searchData, AppException appException)
        exception,
  }) {
    return loaded(searchData, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookSearchData? searchData)? init,
    TResult? Function(BookSearchData? searchData, bool isLoading)? loading,
    TResult? Function(
            BookSearchData? searchData, List<BookDetailResponse> data)?
        loaded,
    TResult? Function(BookSearchData? searchData, AppException appException)?
        exception,
  }) {
    return loaded?.call(searchData, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookSearchData? searchData)? init,
    TResult Function(BookSearchData? searchData, bool isLoading)? loading,
    TResult Function(BookSearchData? searchData, List<BookDetailResponse> data)?
        loaded,
    TResult Function(BookSearchData? searchData, AppException appException)?
        exception,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(searchData, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookSearchInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(BookSearchLoadedState value) loaded,
    required TResult Function(BookSearchExceptionState value) exception,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BookSearchInitial value)? init,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(BookSearchLoadedState value)? loaded,
    TResult? Function(BookSearchExceptionState value)? exception,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookSearchInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(BookSearchLoadedState value)? loaded,
    TResult Function(BookSearchExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class BookSearchLoadedState implements BookSearchState {
  const factory BookSearchLoadedState(final BookSearchData? searchData,
      final List<BookDetailResponse> data) = _$BookSearchLoadedState;

  @override
  BookSearchData? get searchData;
  List<BookDetailResponse> get data;
  @override
  @JsonKey(ignore: true)
  _$$BookSearchLoadedStateCopyWith<_$BookSearchLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookSearchExceptionStateCopyWith<$Res>
    implements $BookSearchStateCopyWith<$Res> {
  factory _$$BookSearchExceptionStateCopyWith(_$BookSearchExceptionState value,
          $Res Function(_$BookSearchExceptionState) then) =
      __$$BookSearchExceptionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookSearchData? searchData, AppException appException});
}

/// @nodoc
class __$$BookSearchExceptionStateCopyWithImpl<$Res>
    extends _$BookSearchStateCopyWithImpl<$Res, _$BookSearchExceptionState>
    implements _$$BookSearchExceptionStateCopyWith<$Res> {
  __$$BookSearchExceptionStateCopyWithImpl(_$BookSearchExceptionState _value,
      $Res Function(_$BookSearchExceptionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchData = freezed,
    Object? appException = null,
  }) {
    return _then(_$BookSearchExceptionState(
      freezed == searchData
          ? _value.searchData
          : searchData // ignore: cast_nullable_to_non_nullable
              as BookSearchData?,
      null == appException
          ? _value.appException
          : appException // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }
}

/// @nodoc

class _$BookSearchExceptionState implements BookSearchExceptionState {
  const _$BookSearchExceptionState(this.searchData, this.appException);

  @override
  final BookSearchData? searchData;
  @override
  final AppException appException;

  @override
  String toString() {
    return 'BookSearchState.exception(searchData: $searchData, appException: $appException)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookSearchExceptionState &&
            (identical(other.searchData, searchData) ||
                other.searchData == searchData) &&
            (identical(other.appException, appException) ||
                other.appException == appException));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchData, appException);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookSearchExceptionStateCopyWith<_$BookSearchExceptionState>
      get copyWith =>
          __$$BookSearchExceptionStateCopyWithImpl<_$BookSearchExceptionState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookSearchData? searchData) init,
    required TResult Function(BookSearchData? searchData, bool isLoading)
        loading,
    required TResult Function(
            BookSearchData? searchData, List<BookDetailResponse> data)
        loaded,
    required TResult Function(
            BookSearchData? searchData, AppException appException)
        exception,
  }) {
    return exception(searchData, appException);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookSearchData? searchData)? init,
    TResult? Function(BookSearchData? searchData, bool isLoading)? loading,
    TResult? Function(
            BookSearchData? searchData, List<BookDetailResponse> data)?
        loaded,
    TResult? Function(BookSearchData? searchData, AppException appException)?
        exception,
  }) {
    return exception?.call(searchData, appException);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookSearchData? searchData)? init,
    TResult Function(BookSearchData? searchData, bool isLoading)? loading,
    TResult Function(BookSearchData? searchData, List<BookDetailResponse> data)?
        loaded,
    TResult Function(BookSearchData? searchData, AppException appException)?
        exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(searchData, appException);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BookSearchInitial value) init,
    required TResult Function(LoadingState value) loading,
    required TResult Function(BookSearchLoadedState value) loaded,
    required TResult Function(BookSearchExceptionState value) exception,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BookSearchInitial value)? init,
    TResult? Function(LoadingState value)? loading,
    TResult? Function(BookSearchLoadedState value)? loaded,
    TResult? Function(BookSearchExceptionState value)? exception,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BookSearchInitial value)? init,
    TResult Function(LoadingState value)? loading,
    TResult Function(BookSearchLoadedState value)? loaded,
    TResult Function(BookSearchExceptionState value)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class BookSearchExceptionState implements BookSearchState {
  const factory BookSearchExceptionState(
          final BookSearchData? searchData, final AppException appException) =
      _$BookSearchExceptionState;

  @override
  BookSearchData? get searchData;
  AppException get appException;
  @override
  @JsonKey(ignore: true)
  _$$BookSearchExceptionStateCopyWith<_$BookSearchExceptionState>
      get copyWith => throw _privateConstructorUsedError;
}
