import 'package:bloc/bloc.dart';
import 'package:domain/model/book/book.dart';
import 'package:domain/repository/book_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/exception/app_exception.dart';
import 'package:presentation/exception/app_exception_handler.dart';
import 'package:presentation/injectors/all.dart';

part 'book_detail_state.dart';
part 'book_detail_cubit.freezed.dart';

class BookDetailCubit extends Cubit<BookDetailState> {
  final String bookId;

  late final BookRepository _bookRepository;
  late final AppExceptionHandler _appExceptionHandler;
  BookDetailCubit(
    this.bookId,
  ) : super(const BookDetailInitial()) {
    _bookRepository = getIt<BookRepository>();
  }

  Future<void> onScreenInit() async {
    emit(const BookDetailState.loading());
    try {
      final loadBookResult = await _bookRepository.loadBook(bookId);

      emit(BookDetailState.loaded(loadBookResult));
    } catch (error) {
      final appException = _appExceptionHandler.mapFirebaseException(error);
      emit(BookDetailState.exception(appException));
    }
  }

  Future<void> onScreenRefresh() async {
    await onScreenInit();
  }
}
