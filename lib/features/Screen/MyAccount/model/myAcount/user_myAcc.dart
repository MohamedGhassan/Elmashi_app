import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'user_myAcc.g.dart';

@JsonSerializable()
class UserMyaccountModel {

  final UserDetails2? data;


  Map<String, dynamic> toJson() => _$UserMyaccountModelToJson(this);
  factory UserMyaccountModel.fromJson(Map<String, dynamic> json) =>
      _$UserMyaccountModelFromJson(json);

  UserMyaccountModel(
      {
        required  this.data,
      });
}
