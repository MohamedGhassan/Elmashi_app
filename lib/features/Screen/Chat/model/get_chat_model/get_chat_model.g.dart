// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChatModel _$GetChatModelFromJson(Map<String, dynamic> json) {
  return GetChatModel(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GetChatModelToJson(GetChatModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
