// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserInfoRequest _$UpdateUserInfoRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateUserInfoRequest(
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      photoURL: json['photoURL'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      bio: json['bio'] as String?,
      website: json['website'] as String?,
      facebookURL: json['facebookURL'] as String?,
      twitterURL: json['twitterURL'] as String?,
    );

Map<String, dynamic> _$UpdateUserInfoRequestToJson(
        UpdateUserInfoRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'email': instance.email,
      'photoURL': instance.photoURL,
      'surname': instance.surname,
      'name': instance.name,
      'bio': instance.bio,
      'website': instance.website,
      'facebookURL': instance.facebookURL,
      'twitterURL': instance.twitterURL,
    };
