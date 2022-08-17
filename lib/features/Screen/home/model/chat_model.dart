import 'package:ealmashi/features/Screen/home/model/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart';
part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel {

  String id = UniqueKey().toString();
  // message text
  String text;
  // time of the message
  int time;
  // user id who send the message
  String userId;




  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  ChatModel(
      {
        required  this.id,
        required  this.text,
        required  this.time,
        required  this.userId,


      });
}
