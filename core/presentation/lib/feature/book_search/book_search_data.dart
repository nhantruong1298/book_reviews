import 'package:presentation/constants/book_type.dart';

class BookSearchData {
  final String? text;
  // final List<String>? tags;
  final BookType? type;

  BookSearchData({
    this.text,
    //this.tags,
    this.type,
  });

  BookSearchData copyWith({
    String? text,
    List<String>? tags,
    BookType? type,
  }) {
    return BookSearchData(
      text: text ?? this.text,
     // tags: tags ?? this.tags,
      type: type ?? this.type,
    );
  }
}
