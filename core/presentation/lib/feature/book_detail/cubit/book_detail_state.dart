part of 'book_detail_cubit.dart';

@freezed
class BookDetailState with _$BookDetailState {
  const factory BookDetailState.init() = BookDetailInitial;
  const factory BookDetailState.loading() = LoadingState;
  const factory BookDetailState.loaded(LoadBookResult? loadBookResult) =
      BookDetailLoadedState;
  const factory BookDetailState.exception(AppException appException) =
      BookDetailExceptionState;
}
