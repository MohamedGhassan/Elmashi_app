import 'package:ealmashi/features/Screen/loginScreen/model/sub_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'instagram_model.g.dart';

@JsonSerializable()
class InstagramModel {

  final int id;
  final String? url;


  Map<String, dynamic> toJson() => _$InstagramModelToJson(this);
  factory InstagramModel.fromJson(Map<String, dynamic> json) =>
      _$InstagramModelFromJson(json);

  InstagramModel(
      {
        required  this.id,
        this.url

      });
}
