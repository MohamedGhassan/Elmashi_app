import 'package:json_annotation/json_annotation.dart';



part 'contactUs_response.g.dart';

@JsonSerializable()
class ContactResponseModel {
  final int? code;
  final bool? statue;
  final String? message;


  Map<String, dynamic> toJson() => _$ContactResponseModelToJson(this);
  factory ContactResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseModelFromJson(json);

  ContactResponseModel(
      {
        required this.code,required  this.statue,required  this.message
      });
}
