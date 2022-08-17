import 'package:ealmashi/features/Screen/MyAccount/model/data.dart';
import 'package:json_annotation/json_annotation.dart';


part 'package_model.g.dart';

@JsonSerializable()
class PackageModel {
 String? name;
 double? cost;



  Map<String, dynamic> toJson() => _$PackageModelToJson(this);
  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);

 PackageModel(
      {
        required  this.name,
        required  this.cost,


      });
}
