// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoliciesModel _$PoliciesModelFromJson(Map<String, dynamic> json) {
  return PoliciesModel(
    data: json['data'] == null
        ? null
        : PoliciesData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PoliciesModelToJson(PoliciesModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
