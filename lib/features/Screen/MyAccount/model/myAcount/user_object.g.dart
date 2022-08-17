// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserObjectModel _$UserObjectModelFromJson(Map<String, dynamic> json) {
  return UserObjectModel(
    id: json['id'] as int,
    name: json['name'] as String?,
    email: json['email'] as String?,
    photo: json['photo'] as String?,
    api_token: json['api_token'] as String,
    phone: json['phone'] as String?,
  );
}

Map<String, dynamic> _$UserObjectModelToJson(UserObjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'photo': instance.photo,
      'phone': instance.phone,
      'api_token': instance.api_token,
    };
