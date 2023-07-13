import 'package:bloc/bloc.dart';
import 'package:domain/model/book/book.dart';
import 'package:domain/repository/book_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/exception/app_exception.dart';
import 'package:presentation/exception/app_exception_handler.dart';
import 'package:presentation/feature/book_search/book_search_data.dart';
import 'package:presentation/injectors/all.dart';

part 'book_search_state.dart';
part 'book_search_cubit.freezed.dart';

class BookSearchCubit extends Cubit<BookSearchState> {
  late final BookRepository _bookRepository;
  late final AppExceptionHandler _appExceptionHandler;

  late List<LoadBookResult> _popularBooks;

  BookSearchCubit() : super(BookSearchInitial(BookSearchData())) {
    _bookRepository = getIt<BookRepository>();
    _appExceptionHandler = getIt<AppExceptionHandler>();
  }

  Future<void> _loadNewBooks(BookSearchData searchData) async {
    if (searchData.text == null || searchData.text!.isEmpty) {
      emit(BookSearchLoadedState(state.searchData, _popularBooks));
      return;
    }

    try {
      final result = await _bookRepository.searchBooks(searchData.text ?? '');

      emit(BookSearchLoadedState(state.searchData, result));
    } catch (error) {
      final appException = _appExceptionHandler.mapFirebaseException(error);
      emit(BookSearchExceptionState(state.searchData, appException));
    }
  }

  Future<void> onSearchTextChanged(String text) async {
    await _loadNewBooks(state.searchData!.copyWith(text: text));
  }

  Future<void> onScreenInit() async {
    try {
      _popularBooks = await _bookRepository.loadPopularBooks();

      emit(BookSearchLoadedState(state.searchData, _popularBooks));
    } catch (error) {
      final appException = _appExceptionHandler.mapFirebaseException(error);
      emit(BookSearchExceptionState(state.searchData, appException));
    }
  }
}
