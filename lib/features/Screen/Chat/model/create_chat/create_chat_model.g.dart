// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateChatModel _$CreateChatModelFromJson(Map<String, dynamic> json) {
  return CreateChatModel(
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateChatModelToJson(CreateChatModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
