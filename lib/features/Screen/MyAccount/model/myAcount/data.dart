import 'package:ealmashi/features/Screen/MyAccount/model/myAcount/user_object.dart';
import 'package:ealmashi/features/Screen/loginScreen/model/sub_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'data.g.dart';

@JsonSerializable()
class UserDetails2 {
  final UserObjectModel? user;

  final List<SubModel>? subscriptions;
  final String? subscribed_package_name;
  Map<String, dynamic> toJson() => _$UserDetails2ToJson(this);
  factory UserDetails2.fromJson(Map<String, dynamic> json) =>
      _$UserDetails2FromJson(json);

  UserDetails2(
      {
        required this.subscriptions,
        required this.subscribed_package_name,
      required this.user
      });
}
