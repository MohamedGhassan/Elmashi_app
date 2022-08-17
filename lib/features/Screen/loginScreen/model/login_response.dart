import 'package:json_annotation/json_annotation.dart';

import 'data.dart';


part 'login_response.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final int? code;
  final bool? statue;
  final Data? data;
  final String? message;


  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  LoginResponseModel(
      {required this.code,required  this.statue,required  this.data,
        required  this.message
      });
}
