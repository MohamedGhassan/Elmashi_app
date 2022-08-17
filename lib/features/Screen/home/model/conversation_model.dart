import 'package:ealmashi/features/Screen/home/model/data.dart';
import 'package:ealmashi/features/Screen/home/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'conversation_model.g.dart';

@JsonSerializable()
class ConversationModel {


  String? id;

  // conversation name for example chat with market name
  String name;

  // Chats messages
  String lastMessage;

  int lastMessageTime;

  // Ids of users that read the chat message
  List<String> readByUsers;

  // Ids of users in this conversation
  List<String> visibleToUsers;

  // users in the conversation
  List<UserChat> users;


  Map<String, dynamic> toJson() => _$ConversationModelToJson(this);
  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);
  ConversationModel(
      {
        required  this.lastMessage,

        required  this.readByUsers,
        required  this.visibleToUsers,
        required  this.users,
        required  this.lastMessageTime,
        required  this.name,
      });

}
