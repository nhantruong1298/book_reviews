// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_user_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadUserInfoResponse _$LoadUserInfoResponseFromJson(
        Map<String, dynamic> json) =>
    LoadUserInfoResponse(
      id: json['id'] as String?,
      email: json['email'] as String?,
      displayName: json['displayName'] as String?,
      surname: json['surname'] as String?,
      name: json['name'] as String?,
      photoURL: json['photoURL'] as String?,
    );

Map<String, dynamic> _$LoadUserInfoResponseToJson(
        LoadUserInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'surname': instance.surname,
      'name': instance.name,
      'photoURL': instance.photoURL,
    };
