// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllConverData _$AllConverDataFromJson(Map<String, dynamic> json) {
  return AllConverData(
    activity_id: json['activity_id'] as int?,
    id: json['id'] as int?,
    user_id: json['user_id'] as int?,
    user: json['user'] == null
        ? null
        : UserSide.fromJson(json['user'] as Map<String, dynamic>),
    activity: json['activity'] == null
        ? null
        : ActivitySide.fromJson(json['activity'] as Map<String, dynamic>),
    created_at: json['created_at'] as String?,
  );
}

Map<String, dynamic> _$AllConverDataToJson(AllConverData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'activity_id': instance.activity_id,
      'user_id': instance.user_id,
      'user': instance.user,
      'activity': instance.activity,
      'created_at': instance.created_at,
    };
