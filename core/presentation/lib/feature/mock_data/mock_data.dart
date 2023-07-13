import 'package:data/entity/response/book_detail_response.dart';
import 'package:data/entity/response/event_detail_response.dart';

class MockData {
  MockData._internal();

  static MockData get shared => _shared;
  static final MockData _shared = MockData._internal();

  List<BookDetailResponse>? bookData;
  List<EventDetailResponse>? eventData;

  static void configureData(
    List<BookDetailResponse> bookData,
    List<EventDetailResponse> eventData,
  ) {
    _shared.bookData = bookData;
    _shared.eventData = eventData;
  }
}
