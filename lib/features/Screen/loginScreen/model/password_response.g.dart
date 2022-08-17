// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordResponseModel _$PasswordResponseModelFromJson(
    Map<String, dynamic> json) {
  return PasswordResponseModel(
    code: json['code'] as int?,
    statue: json['statue'] as bool?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$PasswordResponseModelToJson(
        PasswordResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'statue': instance.statue,
      'message': instance.message,
    };
