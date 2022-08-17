import 'package:ealmashi/features/Screen/loginScreen/model/sub_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'data_user_model.g.dart';

@JsonSerializable()
class UserDetailsModel {

  final int id;
  final String? name;
  final String? email;
  final String? phone;
  final String api_token;
  final List<SubModel> subscriptions;

  Map<String, dynamic> toJson() => _$UserDetailsModelToJson(this);
  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsModelFromJson(json);

  UserDetailsModel(
      {
        required  this.id,
        required  this.name,
        required  this.email,
        required  this.phone,
        required  this.api_token,
        required this.subscriptions
      });
}
