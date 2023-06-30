import 'package:domain/model/book/book.dart';

abstract class BookRepository {
  Future<List<LoadBookResult>> loadTrendingBooks();

  Future<List<LoadBookResult>> loadPopularBooks();

  Future<LoadBookResult?> loadBook(String id);
}
