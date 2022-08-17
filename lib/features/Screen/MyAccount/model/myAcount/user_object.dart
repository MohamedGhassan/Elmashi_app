import 'package:ealmashi/features/Screen/loginScreen/model/sub_model.dart';
import 'package:json_annotation/json_annotation.dart';




part 'user_object.g.dart';

@JsonSerializable()
class UserObjectModel {

  final int id;
  final String? name;
  final String? email;
  final String? photo;
  final String? phone;
  final String api_token;



  Map<String, dynamic> toJson() => _$UserObjectModelToJson(this);
  factory UserObjectModel.fromJson(Map<String, dynamic> json) =>
      _$UserObjectModelFromJson(json);

  UserObjectModel(
      {
        required  this.id,
        required  this.name,
        required  this.email,
        required  this.photo,
        required  this.api_token,
        required   this.phone,

      });
}
