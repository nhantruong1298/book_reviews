import 'package:domain/model/book/book.dart';

abstract class BookRepository {
  Future<List<LoadBookResult>> loadTrendingBooks();
}
