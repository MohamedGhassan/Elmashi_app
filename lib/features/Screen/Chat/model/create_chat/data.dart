import 'package:json_annotation/json_annotation.dart';



part 'data.g.dart';

@JsonSerializable()
class Data {


  final int? id;
  final int? activity_id;


  Map<String, dynamic> toJson() => _$DataToJson(this);
  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Data(
      {
        required  this.activity_id,
        required  this.id,

      });
}
