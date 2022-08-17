// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageModel _$SendMessageModelFromJson(Map<String, dynamic> json) {
  return SendMessageModel(
    data: json['data'] == null
        ? null
        : DataSend.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SendMessageModelToJson(SendMessageModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
