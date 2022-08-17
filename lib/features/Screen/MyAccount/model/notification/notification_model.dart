import 'package:json_annotation/json_annotation.dart';
import 'data.dart';


part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {

  final DataNot? data;


  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  NotificationModel(
      {
        required  this.data,
      });
}
