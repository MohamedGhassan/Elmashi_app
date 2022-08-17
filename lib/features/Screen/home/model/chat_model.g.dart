// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return ChatModel(
    id: json['id'] as String,
    text: json['text'] as String,
    time: json['time'] as int,
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'time': instance.time,
      'userId': instance.userId,
    };
