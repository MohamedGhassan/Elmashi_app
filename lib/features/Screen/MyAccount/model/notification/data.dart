import 'package:ealmashi/features/Screen/MyAccount/model/notification/seen_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/notification/useen_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'data.g.dart';

@JsonSerializable()
class DataNot {

List<SeenData>? allNotifications;
List<UnSeenData>? unseenNotifications;


  Map<String, dynamic> toJson() => _$DataNotToJson(this);
  factory DataNot.fromJson(Map<String, dynamic> json) =>
      _$DataNotFromJson(json);

DataNot(
      {
        required  this.allNotifications,
        required  this.unseenNotifications,

      });
}
