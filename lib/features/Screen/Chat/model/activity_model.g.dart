// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivitySide _$ActivitySideFromJson(Map<String, dynamic> json) {
  return ActivitySide(
    name: json['name'] as String?,
    id: json['id'] as int?,
    phone: json['phone'] as String?,
    user: json['user'] == null
        ? null
        : UserSide.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ActivitySideToJson(ActivitySide instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'user': instance.user,
    };
