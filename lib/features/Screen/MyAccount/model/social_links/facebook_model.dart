import 'package:ealmashi/features/Screen/loginScreen/model/sub_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'facebook_model.g.dart';

@JsonSerializable()
class FacebookModel {

  final int id;
  final String? url;


  Map<String, dynamic> toJson() => _$FacebookModelToJson(this);
  factory FacebookModel.fromJson(Map<String, dynamic> json) =>
      _$FacebookModelFromJson(json);

  FacebookModel(
      {
        required  this.id,
        this.url

      });
}
