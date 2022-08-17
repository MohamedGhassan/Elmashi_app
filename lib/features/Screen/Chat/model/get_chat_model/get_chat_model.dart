import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'get_chat_model.g.dart';

@JsonSerializable()
class GetChatModel {
    List<Data>  ? data;


  Map<String, dynamic> toJson() => _$GetChatModelToJson(this);
  factory GetChatModel.fromJson(Map<String, dynamic> json) =>
      _$GetChatModelFromJson(json);

 GetChatModel(
      {
        required  this.data,

      });
}
