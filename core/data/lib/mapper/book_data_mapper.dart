import 'package:data/entity/response/load_book_response.dart';
import 'package:domain/model/book/book.dart';

class BookDataMapper {
  List<LoadBookResult> mapListBookResponse(List<LoadBookResponse> list) {
    final result = <LoadBookResult>[];
    for (final item in list) {
      result.add(LoadBookResult(
        author: item.author,
        image: item.image,
        description: item.description,
        id: item.id,
        name: item.name,
        reviewIDs: item.reviewIds,
        tags: item.tags,
      ));
    }
    return result;
  }
}
