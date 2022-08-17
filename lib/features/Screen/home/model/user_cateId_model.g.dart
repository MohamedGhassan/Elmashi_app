// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cateId_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCate _$UserCateFromJson(Map<String, dynamic> json) {
  return UserCate(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$UserCateToJson(UserCate instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
    };
