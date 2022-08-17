import 'package:ealmashi/features/Screen/loginScreen/model/sub_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'snapchat_model.g.dart';

@JsonSerializable()
class SnapchatModel {

  final int id;
  final String? url;


  Map<String, dynamic> toJson() => _$SnapchatModelToJson(this);
  factory SnapchatModel.fromJson(Map<String, dynamic> json) =>
      _$SnapchatModelFromJson(json);

  SnapchatModel(
      {
        required  this.id,
        this.url

      });
}
