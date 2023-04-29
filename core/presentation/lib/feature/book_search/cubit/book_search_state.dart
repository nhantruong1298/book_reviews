part of 'book_search_cubit.dart';

@freezed
class BookSearchState with _$BookSearchState {
  const factory BookSearchState.init(BookSearchData? searchData) =
      BookSearchInitial;

  const factory BookSearchState.loading(
    BookSearchData? searchData,
    bool isLoading,
  ) = LoadingState;

  const factory BookSearchState.loaded(
    BookSearchData? searchData,
    List<BookDetailResponse> data,
  ) = BookSearchLoadedState;

  const factory BookSearchState.exception(
    BookSearchData? searchData,
    AppException appException,
  ) = BookSearchExceptionState;
}
