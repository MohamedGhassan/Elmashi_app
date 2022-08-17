import 'package:json_annotation/json_annotation.dart';

import 'activity_model.dart';
import 'user_model.dart';


part 'data.g.dart';

@JsonSerializable()
class AllConverData {


  final int? id;
  final int? activity_id;
  final int? user_id;
  UserSide? user;
  ActivitySide?activity ;
  final String? created_at;

  Map<String, dynamic> toJson() => _$AllConverDataToJson(this);
  factory AllConverData.fromJson(Map<String, dynamic> json) =>
      _$AllConverDataFromJson(json);

  AllConverData(
      {
        required  this.activity_id,
        required  this.id,
        required  this.user_id,
        required  this.user,
        required  this.activity,
         required this.created_at,
      });
}
