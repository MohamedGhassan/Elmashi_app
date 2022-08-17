
import 'package:json_annotation/json_annotation.dart';
part 'user_cateId_model.g.dart';

@JsonSerializable()
class UserCate {

  int id;
  String name;
  String email;
  String phone;


  Map<String, dynamic> toJson() => _$UserCateToJson(this);
  factory UserCate.fromJson(Map<String, dynamic> json) =>
      _$UserCateFromJson(json);

  UserCate(
      {
        required  this.id,
        required  this.name,
        required  this.email,
        required  this.phone,

      });
}
