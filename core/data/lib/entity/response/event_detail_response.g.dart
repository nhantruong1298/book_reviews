// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDetailResponse _$EventDetailResponseFromJson(Map<String, dynamic> json) =>
    EventDetailResponse(
      eventName: json['eventName'] as String?,
      content: json['content'] as String?,
      dateStart: json['dateStart'] == null
          ? null
          : DateTime.parse(json['dateStart'] as String),
      dateEnd: json['dateEnd'] == null
          ? null
          : DateTime.parse(json['dateEnd'] as String),
      imageUrl: json['imageUrl'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$EventDetailResponseToJson(
        EventDetailResponse instance) =>
    <String, dynamic>{
      'eventName': instance.eventName,
      'content': instance.content,
      'dateStart': instance.dateStart?.toIso8601String(),
      'dateEnd': instance.dateEnd?.toIso8601String(),
      'imageUrl': instance.imageUrl,
      'id': instance.id,
    };
