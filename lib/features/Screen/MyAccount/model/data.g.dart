// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) {
  return UserDetails(
    id: json['id'] as int,
    name: json['name'] as String?,
    email: json['email'] as String?,
    photo: json['photo'] as String?,
    api_token: json['api_token'] as String,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'email': instance.email,
      'photo': instance.photo,
      'api_token': instance.api_token,
    };
