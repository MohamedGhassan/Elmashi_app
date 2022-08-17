import 'data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponseModel {
  final int? code;
  final bool? statue;
  final Data? data;
  final String? message;


  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  RegisterResponseModel(
      {required this.code,required  this.statue,required  this.data,
        required  this.message
      });
}