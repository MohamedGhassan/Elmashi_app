

import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'social_links_model.g.dart';

@JsonSerializable()
class SocialLinksModel {

  final SocialLinksData? data;


  Map<String, dynamic> toJson() => _$SocialLinksModelToJson(this);
  factory SocialLinksModel.fromJson(Map<String, dynamic> json) =>
      _$SocialLinksModelFromJson(json);

  SocialLinksModel(
      {
        required  this.data,
      });
}
