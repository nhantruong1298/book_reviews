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
  final String? website;
  final String? facebookURL;
  final String? twitterURL;

  factory UpdateUserInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserInfoRequestFromJson(json);

  UpdateUserInfoRequest({
     this.id,
     this.displayName,
     this.email,
     this.photoURL,
     this.name,
     this.surname,
     this.bio,
     this.website,
     this.facebookURL,
     this.twitterURL,
  });

  Map<String, dynamic> toJson() => _$UpdateUserInfoRequestToJson(this);
}
