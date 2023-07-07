import 'package:json_annotation/json_annotation.dart';
part 'update_user_info_request.g.dart';

@JsonSerializable()
class UpdateUserInfoRequest {
  final String? id;
  final String? displayName;
  final String? email;
  final String? photoURL;
  final String? surname;
  final String? name;
  final String? bio;

  factory UpdateUserInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserInfoRequestFromJson(json);

  UpdateUserInfoRequest({
    required this.id,
    required this.displayName,
    required this.email,
    required this.photoURL,
    required this.name,
    required this.surname,
    required this.bio,
  });

  Map<String, dynamic> toJson() => _$UpdateUserInfoRequestToJson(this);
}
