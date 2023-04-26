part of 'book_detail_cubit.dart';

@freezed
class BookDetailState with _$BookDetailState {
  const factory BookDetailState.init() = BookDetailInitial;
  const factory BookDetailState.loading(bool isLoading) = LoadingState;
  const factory BookDetailState.loaded(BookDetailResponse? response) =
      BookDetailLoadedState;
  const factory BookDetailState.exception(AppException appException) =
      BookDetailExceptionState;
}
