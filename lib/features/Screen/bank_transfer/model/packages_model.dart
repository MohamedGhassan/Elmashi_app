
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';
part 'packages_model.g.dart';

@JsonSerializable()
class PackagesModel {


  final List<Data>? data;


  Map<String, dynamic> toJson() => _$PackagesModelToJson(this);
  factory PackagesModel.fromJson(Map<String, dynamic> json) =>
      _$PackagesModelFromJson(json);

  PackagesModel(
      {
        required  this.data,

      });
}
