import 'package:ealmashi/features/Screen/loginScreen/model/sub_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'data.g.dart';

@JsonSerializable()
class UserDetails {

  final int id;
  final String? name;
  final String? type;
  final String? email;
  final String? photo;
  final String api_token;

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);

  UserDetails(
      {
        required  this.id,
        required  this.name,
        required  this.email,
        required  this.photo,
        required  this.api_token,
        required this.type
      });
}
