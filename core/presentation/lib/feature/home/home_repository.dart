import 'package:domain/model/book/book.dart';
import 'package:domain/repository/book_repository.dart';
import 'package:presentation/injectors/all.dart';

class HomeRepository {
  late final BookRepository _bookRepository;
  HomeRepository() {
    _bookRepository = getIt<BookRepository>();
  }

  Future<List<LoadBookResult>> loadTrendingBooks() async {
    final result = await _bookRepository.loadTrendingBooks();
    return result;
  }
}
