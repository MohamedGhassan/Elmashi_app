// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_us_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutUsModel _$AboutUsModelFromJson(Map<String, dynamic> json) {
  return AboutUsModel(
    data: json['data'] == null
        ? null
        : AboutUSData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AboutUsModelToJson(AboutUsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
