import 'package:bloc/bloc.dart';
import 'package:domain/model/book/book.dart';
import 'package:domain/repository/book_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/exception/app_exception.dart';
import 'package:presentation/exception/app_exception_handler.dart';

import 'package:presentation/injectors/all.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  late final BookRepository _bookRepository;
  late final AppExceptionHandler _appExceptionHandler;
  HomeCubit() : super(const HomeInitial()) {
    _bookRepository = getIt<BookRepository>();
    _appExceptionHandler = getIt<AppExceptionHandler>();
  }

  Future<void> onScreenInit() async {
    try {
      final trendingBooksResult = await _bookRepository.loadTrendingBooks();
      final popularBooksResult = await _bookRepository.loadPopularBooks();

      emit(HomeLoadedState(trendingBooksResult, popularBooksResult));
    } catch (error) {
      final appException = _appExceptionHandler.mapFirebaseException(error);
      emit(HomeState.exception(appException));
    }
  }
}
