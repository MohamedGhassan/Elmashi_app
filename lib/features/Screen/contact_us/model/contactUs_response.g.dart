// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactUs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactResponseModel _$ContactResponseModelFromJson(Map<String, dynamic> json) {
  return ContactResponseModel(
    code: json['code'] as int?,
    statue: json['statue'] as bool?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$ContactResponseModelToJson(
        ContactResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'statue': instance.statue,
      'message': instance.message,
    };
