import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'policies_model.g.dart';

@JsonSerializable()
class PoliciesModel {

  PoliciesData? data;


  Map<String, dynamic> toJson() => _$PoliciesModelToJson(this);
  factory PoliciesModel.fromJson(Map<String, dynamic> json) =>
      _$PoliciesModelFromJson(json);

  PoliciesModel(
      {
        required this.data,
      });
}