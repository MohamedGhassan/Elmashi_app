import 'package:ealmashi/features/Screen/home/model/user_cateId_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cate_id_model.dart';


part 'data_cateid.g.dart';

@JsonSerializable()
class DataCateId {


  final int? id;
  final String? name;
  final  CategoryIdChildModel?  category;
  final List<UserCate> ? user;
  final double? latitude;
  final double? longitude;
  Map<String, dynamic> toJson() => _$DataCateIdToJson(this);
  factory DataCateId.fromJson(Map<String, dynamic> json) =>
      _$DataCateIdFromJson(json);

  DataCateId(
      {
        required  this.name,
        required  this.id,
        required this.category,
        required this.latitude,
        required this.longitude,
        required this.user
      });
}
