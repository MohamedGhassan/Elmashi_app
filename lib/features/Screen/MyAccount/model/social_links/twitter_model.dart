import 'package:ealmashi/features/Screen/loginScreen/model/sub_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'twitter_model.g.dart';

@JsonSerializable()
class TwitterModel {

  final int id;
  final String? url;


  Map<String, dynamic> toJson() => _$TwitterModelToJson(this);
  factory TwitterModel.fromJson(Map<String, dynamic> json) =>
      _$TwitterModelFromJson(json);

  TwitterModel(
      {
        required  this.id,
        this.url

      });
}
