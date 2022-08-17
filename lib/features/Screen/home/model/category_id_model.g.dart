// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryIdModel _$CategoryIdModelFromJson(Map<String, dynamic> json) {
  return CategoryIdModel(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => DataCateId.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CategoryIdModelToJson(CategoryIdModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
