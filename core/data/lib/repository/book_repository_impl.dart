import 'package:data/mapper/book_data_mapper.dart';
import 'package:data/networking/service_manager.dart';
import 'package:domain/model/book/book.dart';
import 'package:domain/repository/book_repository.dart';

class BookRepositoryImpl extends BookRepository {
  final ServiceManager _serviceManager;
  final BookDataMapper _dataMapper;
  BookRepositoryImpl(this._serviceManager,this._dataMapper);

  @override
  Future<List<LoadBookResult>> loadTrendingBooks() async {
    final listResponse = await _serviceManager.loadTrendingBooks();
    return _dataMapper.mapListBookResponse(listResponse);
  }
}
