import 'package:json_annotation/json_annotation.dart';
part 'load_user_info_response.g.dart';

@JsonSerializable()
class LoadUserInfoResponse {
  final String? id;
  final String? email;
  final String? displayName;
  final String? surname;
  final String? name;
  final String? photoURL;
  final String? bio;
  final String? website;
  final String? facebookURL;
  final String? twitterURL;

  factory LoadUserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$LoadUserInfoResponseFromJson(json);

  LoadUserInfoResponse({
    this.id,
    this.email,
    this.displayName,
    this.surname,
    this.name,
    this.photoURL,
    this.bio,
    this.website,
    this.facebookURL,
    this.twitterURL,
  });

  Map<String, dynamic> toJson() => _$LoadUserInfoResponseToJson(this);
}
