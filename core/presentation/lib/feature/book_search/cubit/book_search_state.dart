part of 'book_search_cubit.dart';

@freezed
class BookSearchState with _$BookSearchState {
  const factory BookSearchState.init(BookSearchData? searchData) =
      BookSearchInitial;

  const factory BookSearchState.loading(
    BookSearchData? searchData,
  ) = LoadingState;

  const factory BookSearchState.loaded(
    BookSearchData? searchData,
    List<LoadBookResult> data,
  ) = BookSearchLoadedState;

  const factory BookSearchState.exception(
    BookSearchData? searchData,
    AppException appException,
  ) = BookSearchExceptionState;
}
