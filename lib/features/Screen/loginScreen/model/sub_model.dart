import 'package:ealmashi/features/Screen/MyAccount/model/data.dart';
import 'package:ealmashi/features/Screen/loginScreen/model/package_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'sub_model.g.dart';

@JsonSerializable()
class SubModel {
 String? from;
 String? to;
 String? status;
 PackageModel? package;


  Map<String, dynamic> toJson() => _$SubModelToJson(this);
  factory SubModel.fromJson(Map<String, dynamic> json) =>
      _$SubModelFromJson(json);

  SubModel(
      {
        required  this.from,
        required  this.to,
        required  this.package,
        this.status
      });
}
