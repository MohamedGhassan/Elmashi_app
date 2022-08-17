import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'create_chat_model.g.dart';

@JsonSerializable()
class CreateChatModel {
 Data ? data;


  Map<String, dynamic> toJson() => _$CreateChatModelToJson(this);
  factory CreateChatModel.fromJson(Map<String, dynamic> json) =>
      _$CreateChatModelFromJson(json);

  CreateChatModel(
      {
        required  this.data,

      });
}
