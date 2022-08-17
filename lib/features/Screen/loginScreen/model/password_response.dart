import 'package:json_annotation/json_annotation.dart';




part 'password_response.g.dart';

@JsonSerializable()
class PasswordResponseModel {
  final int? code;
  final bool? statue;

  final String? message;


  Map<String, dynamic> toJson() => _$PasswordResponseModelToJson(this);
  factory PasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordResponseModelFromJson(json);

  PasswordResponseModel(
      {required this.code,required  this.statue,
        required  this.message
      });
}
