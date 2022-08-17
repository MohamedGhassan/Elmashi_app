// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeenData _$SeenDataFromJson(Map<String, dynamic> json) {
  return SeenData(
    id: json['id'] as int?,
    seen: json['seen'] as int?,
    url: json['url'] as String?,
    content: json['content'] as String?,
    created_at: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
  );
}

Map<String, dynamic> _$SeenDataToJson(SeenData instance) => <String, dynamic>{
      'id': instance.id,
      'seen': instance.seen,
      'url': instance.url,
      'content': instance.content,
      'created_at': instance.created_at?.toIso8601String(),
    };
