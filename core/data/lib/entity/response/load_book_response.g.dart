// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_book_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadBookResponse _$LoadBookResponseFromJson(Map<String, dynamic> json) =>
    LoadBookResponse(
      name: json['name'] as String?,
      author: json['author'] as String?,
      description: json['description'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      image: json['image'] as String?,
      id: json['id'] as String?,
      reviewIds: (json['reviewIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$LoadBookResponseToJson(LoadBookResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'image': instance.image,
      'description': instance.description,
      'tags': instance.tags,
      'reviewIds': instance.reviewIds,
    };
