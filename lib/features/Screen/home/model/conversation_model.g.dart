// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) {
  return ConversationModel(
    lastMessage: json['lastMessage'] as String,
    readByUsers:
        (json['readByUsers'] as List<dynamic>).map((e) => e as String).toList(),
    visibleToUsers: (json['visibleToUsers'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    users: (json['users'] as List<dynamic>)
        .map((e) => UserChat.fromJson(e as Map<String, dynamic>))
        .toList(),
    lastMessageTime: json['lastMessageTime'] as int,
    name: json['name'] as String,
  )..id = json['id'] as String?;
}

Map<String, dynamic> _$ConversationModelToJson(ConversationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastMessage': instance.lastMessage,
      'lastMessageTime': instance.lastMessageTime,
      'readByUsers': instance.readByUsers,
      'visibleToUsers': instance.visibleToUsers,
      'users': instance.users,
    };
