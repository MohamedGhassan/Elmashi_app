// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseModel _$RegisterResponseModelFromJson(
    Map<String, dynamic> json) {
  return RegisterResponseModel(
    code: json['code'] as int?,
    statue: json['statue'] as bool?,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$RegisterResponseModelToJson(
        RegisterResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'statue': instance.statue,
      'data': instance.data,
      'message': instance.message,
    };
