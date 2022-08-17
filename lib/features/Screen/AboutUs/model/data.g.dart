// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutUSData _$AboutUSDataFromJson(Map<String, dynamic> json) {
  return AboutUSData(
    id: json['id'] as int?,
    name: json['name'] as String?,
    title: json['title'] as String?,
    content: json['content'] as String?,
  );
}

Map<String, dynamic> _$AboutUSDataToJson(AboutUSData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'name': instance.name,
      'content': instance.content,
    };
