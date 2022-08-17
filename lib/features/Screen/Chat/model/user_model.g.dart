// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSide _$UserSideFromJson(Map<String, dynamic> json) {
  return UserSide(
    name: json['name'] as String?,
    id: json['id'] as int?,
    phone: json['phone'] as String?,
  );
}

Map<String, dynamic> _$UserSideToJson(UserSide instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
    };
