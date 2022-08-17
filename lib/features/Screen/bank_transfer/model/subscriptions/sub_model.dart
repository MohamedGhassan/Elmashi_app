import 'package:json_annotation/json_annotation.dart';



part 'sub_model.g.dart';

@JsonSerializable()
class SubscriptionModel {

  int? code;
  bool? status;


  Map<String, dynamic> toJson() => _$SubscriptionModelToJson(this);
  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);

  SubscriptionModel(
      {
        required this.code,
        required this.status,
      });
}
