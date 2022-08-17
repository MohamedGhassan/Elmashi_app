// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackagesModel _$PackagesModelFromJson(Map<String, dynamic> json) {
  return PackagesModel(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PackagesModelToJson(PackagesModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
