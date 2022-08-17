// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsModel _$UserDetailsModelFromJson(Map<String, dynamic> json) {
  return UserDetailsModel(
    id: json['id'] as int,
    name: json['name'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    api_token: json['api_token'] as String,
    subscriptions: (json['subscriptions'] as List<dynamic>)
        .map((e) => SubModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UserDetailsModelToJson(UserDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'api_token': instance.api_token,
      'subscriptions': instance.subscriptions,
    };
