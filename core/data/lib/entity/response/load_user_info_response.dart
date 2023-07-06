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

  factory LoadUserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$LoadUserInfoResponseFromJson(json);

  LoadUserInfoResponse({
    this.id,
    this.email,
    this.displayName,
    this.surname,
    this.name,
    this.photoURL,
  });

  Map<String, dynamic> toJson() => _$LoadUserInfoResponseToJson(this);
}
