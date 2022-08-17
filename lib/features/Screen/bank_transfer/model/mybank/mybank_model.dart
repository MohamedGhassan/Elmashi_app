import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'mybank_model.g.dart';

@JsonSerializable()
class MyBankModel {

  List<Data>? data;


  Map<String, dynamic> toJson() => _$MyBankModelToJson(this);
  factory MyBankModel.fromJson(Map<String, dynamic> json) =>
      _$MyBankModelFromJson(json);

 MyBankModel(
      {
        required this.data,
      });
}