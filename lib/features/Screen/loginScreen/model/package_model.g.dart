// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageModel _$PackageModelFromJson(Map<String, dynamic> json) {
  return PackageModel(
    name: json['name'] as String?,
    cost: (json['cost'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$PackageModelToJson(PackageModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cost': instance.cost,
    };
