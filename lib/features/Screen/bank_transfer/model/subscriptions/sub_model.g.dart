// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) {
  return SubscriptionModel(
    code: json['code'] as int?,
    status: json['status'] as bool?,
  );
}

Map<String, dynamic> _$SubscriptionModelToJson(SubscriptionModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
    };
