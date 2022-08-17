// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataSend _$DataSendFromJson(Map<String, dynamic> json) {
  return DataSend(
    conversation_id: json['conversation_id'] as int?,
    id: json['id'] as int?,
    content: json['content'] as String?,
    is_read: json['is_read'] as int?,
    is_from_user: json['is_from_user'] as int?,
    created_at: json['created_at'] as String?,
  );
}

Map<String, dynamic> _$DataSendToJson(DataSend instance) => <String, dynamic>{
      'id': instance.id,
      'conversation_id': instance.conversation_id,
      'content': instance.content,
      'is_read': instance.is_read,
      'is_from_user': instance.is_from_user,
      'created_at': instance.created_at,
    };
