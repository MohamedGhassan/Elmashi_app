// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'useen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnSeenData _$UnSeenDataFromJson(Map<String, dynamic> json) {
  return UnSeenData(
    id: json['id'] as int?,
    seen: json['seen'] as int?,
    url: json['url'] as String?,
    content: json['content'] as String?,
    created_at: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
  );
}

Map<String, dynamic> _$UnSeenDataToJson(UnSeenData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seen': instance.seen,
      'url': instance.url,
      'content': instance.content,
      'created_at': instance.created_at?.toIso8601String(),
    };
