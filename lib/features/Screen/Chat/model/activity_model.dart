import 'package:ealmashi/features/Screen/Chat/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'activity_model.g.dart';

@JsonSerializable()
class ActivitySide {


  final int? id;
  final String? name;
  final String? phone;
  final  UserSide? user;
  Map<String, dynamic> toJson() => _$ActivitySideToJson(this);
  factory ActivitySide.fromJson(Map<String, dynamic> json) =>
      _$ActivitySideFromJson(json);

  ActivitySide(
      {
        required  this.name,
        required  this.id,
        required this.phone,
        required this.user
      });
}
