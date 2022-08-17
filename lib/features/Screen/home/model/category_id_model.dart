import 'package:ealmashi/features/Screen/home/model/data_cateid.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_id_model.g.dart';

@JsonSerializable()
class CategoryIdModel {


  final List<DataCateId>? data;


  Map<String, dynamic> toJson() => _$CategoryIdModelToJson(this);
  factory CategoryIdModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryIdModelFromJson(json);

  CategoryIdModel(
      {
        required  this.data,

      });
}
