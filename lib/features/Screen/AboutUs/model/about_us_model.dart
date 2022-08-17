import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'about_us_model.g.dart';

@JsonSerializable()
class AboutUsModel {

  AboutUSData? data;


  Map<String, dynamic> toJson() => _$AboutUsModelToJson(this);
  factory AboutUsModel.fromJson(Map<String, dynamic> json) =>
      _$AboutUsModelFromJson(json);

  AboutUsModel(
      {
        required this.data,
      });
}