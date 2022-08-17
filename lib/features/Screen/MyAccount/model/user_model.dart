import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'user_model.g.dart';

@JsonSerializable()
class UserModel {

  final UserDetails? data;


  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserModel(
      {
        required  this.data,
      });
}
