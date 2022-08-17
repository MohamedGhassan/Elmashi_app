// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubModel _$SubModelFromJson(Map<String, dynamic> json) {
  return SubModel(
    from: json['from'] as String?,
    to: json['to'] as String?,
    package: json['package'] == null
        ? null
        : PackageModel.fromJson(json['package'] as Map<String, dynamic>),
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$SubModelToJson(SubModel instance) => <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'status': instance.status,
      'package': instance.package,
    };
