// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_conversations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllConversationsModel _$AllConversationsModelFromJson(
    Map<String, dynamic> json) {
  return AllConversationsModel(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => AllConverData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AllConversationsModelToJson(
        AllConversationsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
