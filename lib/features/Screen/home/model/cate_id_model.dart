import 'package:ealmashi/features/Screen/home/model/user_cateId_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'cate_id_model.g.dart';

@JsonSerializable()
class CategoryIdChildModel {


  final int? id;
  final String? name;


  Map<String, dynamic> toJson() => _$CategoryIdChildModelToJson(this);
  factory CategoryIdChildModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryIdChildModelFromJson(json);

  CategoryIdChildModel(
      {
        required  this.name,
        required  this.id,

      });
}
