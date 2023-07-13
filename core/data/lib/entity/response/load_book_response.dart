import 'package:json_annotation/json_annotation.dart';
part 'load_book_response.g.dart';

@JsonSerializable()
class LoadBookResponse {
  String? id;
  final String? name;
  final String? author;
  final String? image;
  //final String? bookLanguage;
  //final int? ratingStars;
  final String? description;
  final List<String>? tags;
  final List<String>? reviewIds;

  factory LoadBookResponse.fromJson(Map<String, dynamic> json) =>
      _$LoadBookResponseFromJson(json);

  LoadBookResponse({
    this.name,
    this.author,
    //this.bookLanguage,
    //this.ratingStars,
    this.description,
    this.tags,
    this.image,
    this.id,
    this.reviewIds,
  });

  Map<String, dynamic> toJson() => _$LoadBookResponseToJson(this);
}
