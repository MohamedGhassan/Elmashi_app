import 'package:json_annotation/json_annotation.dart';


part 'user_model.g.dart';

@JsonSerializable()
class UserSide {


  final int? id;
  final String? name;
  final String? phone;


  Map<String, dynamic> toJson() => _$UserSideToJson(this);
  factory UserSide.fromJson(Map<String, dynamic> json) =>
      _$UserSideFromJson(json);

  UserSide(
      {
        required  this.name,
        required  this.id,
        required this.phone
      });
}
