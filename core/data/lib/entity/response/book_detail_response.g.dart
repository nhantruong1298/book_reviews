// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDetailResponse _$BookDetailResponseFromJson(Map<String, dynamic> json) =>
    BookDetailResponse(
      bookName: json['bookName'] as String?,
      bookAuthor: json['bookAuthor'] as String?,
      bookLanguage: json['bookLanguage'] as String?,
      ratingStars: json['ratingStars'] as int?,
      description: json['description'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      linkImageBook: json['linkImageBook'] as String?,
      bookID: json['id'] as String?,
    );

Map<String, dynamic> _$BookDetailResponseToJson(BookDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.bookID,
      'bookName': instance.bookName,
      'bookAuthor': instance.bookAuthor,
      'bookLanguage': instance.bookLanguage,
      'ratingStars': instance.ratingStars,
      'description': instance.description,
      'tags': instance.tags,
      'linkImageBook': instance.linkImageBook,
    };
