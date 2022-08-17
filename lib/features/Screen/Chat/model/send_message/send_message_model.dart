import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'send_message_model.g.dart';

@JsonSerializable()
class SendMessageModel {


  DataSend  ? data;


  Map<String, dynamic> toJson() => _$SendMessageModelToJson(this);
  factory SendMessageModel.fromJson(Map<String, dynamic> json) =>
      _$SendMessageModelFromJson(json);

    SendMessageModel(
      {
        required  this.data,

      });
}
