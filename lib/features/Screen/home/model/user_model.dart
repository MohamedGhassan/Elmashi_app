import 'package:ealmashi/features/Screen/home/model/data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserChat {

  String id;
  String name;


  Map<String, dynamic> toJson() => _$UserChatToJson(this);
  factory UserChat.fromJson(Map<String, dynamic> json) =>
      _$UserChatFromJson(json);

  UserChat(
      {
        required  this.id,
        required  this.name,

      });
}
