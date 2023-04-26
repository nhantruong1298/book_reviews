import 'package:json_annotation/json_annotation.dart';
part 'book_detail_response.g.dart';

@JsonSerializable()
class BookDetailResponse {
  @JsonKey(name: 'id')
  final String? bookID;

  final String? bookName;
  final String? bookAuthor;
  final String? bookLanguage;
  final int? ratingStars;
  final String? description;
  final List<String>? tags;
  final String? linkImageBook;

  factory BookDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$BookDetailResponseFromJson(json);

  BookDetailResponse({
    this.bookName,
    this.bookAuthor,
    this.bookLanguage,
    this.ratingStars,
    this.description,
    this.tags,
    this.linkImageBook,
    this.bookID,
  });

  Map<String, dynamic> toJson() => _$BookDetailResponseToJson(this);
}
