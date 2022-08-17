import 'package:json_annotation/json_annotation.dart';


part 'data.g.dart';

@JsonSerializable()
class Data {


  final int? id;
  final String? name;
  final double? cost;
  final int? days;

  Map<String, dynamic> toJson() => _$DataToJson(this);
  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Data(
      {
        required  this.name,
        required  this.id,
         required this.cost,
        required this.days
      });
}
