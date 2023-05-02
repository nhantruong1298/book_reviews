import 'package:json_annotation/json_annotation.dart';
part 'event_detail_response.g.dart';

@JsonSerializable()
class EventDetailResponse {
  final String? eventName;
  final String? content;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final String? imageUrl;
  final String? id;

  factory EventDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$EventDetailResponseFromJson(json);

  EventDetailResponse({
    this.eventName,
    this.content,
    this.dateStart,
    this.dateEnd,
    this.imageUrl,
    this.id,
  });

  Map<String, dynamic> toJson() => _$EventDetailResponseToJson(this);
}
