import 'package:ealmashi/features/Screen/loginScreen/model/sub_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'whatsapp_model.g.dart';

@JsonSerializable()
class WhatsappModel {

  final int id;
  final String? url;


  Map<String, dynamic> toJson() => _$WhatsappModelToJson(this);
  factory WhatsappModel.fromJson(Map<String, dynamic> json) =>
      _$WhatsappModelFromJson(json);

  WhatsappModel(
      {
        required  this.id,
        this.url

      });
}
