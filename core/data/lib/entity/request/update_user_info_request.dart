import 'package:json_annotation/json_annotation.dart';
part 'update_user_info_request.g.dart';

@JsonSerializable()
class UpdateUserInfoRequest {
  final String id;

  final String displayName;
  final String email;
  final String photoURL;

  factory UpdateUserInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserInfoRequestFromJson(json);

  UpdateUserInfoRequest({
    required this.id,
    required this.displayName,
    required this.email,
    required this.photoURL,
  });

  Map<String, dynamic> toJson() => _$UpdateUserInfoRequestToJson(this);
}
