import 'package:ealmashi/features/Screen/home/model/data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'categories_model.g.dart';

@JsonSerializable()
class CategoryModel {


  final List<Data>? data;


  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  CategoryModel(
      {
        required  this.data,

      });
}
