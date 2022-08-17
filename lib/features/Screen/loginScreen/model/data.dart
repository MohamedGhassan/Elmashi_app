import 'package:ealmashi/features/Screen/MyAccount/model/data.dart';
import 'package:ealmashi/features/Screen/loginScreen/model/sub_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'data.g.dart';

@JsonSerializable()
class Data {

  final UserDetails user;
  final List<SubModel>? subscriptions;
  final String? subscribed_package_name;

  Map<String, dynamic> toJson() => _$DataToJson(this);
  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Data(
      {
        required  this.user,
        required this.subscribed_package_name,
        required this.subscriptions

      });
}
