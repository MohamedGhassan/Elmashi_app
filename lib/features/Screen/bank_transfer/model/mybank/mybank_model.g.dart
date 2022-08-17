// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mybank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyBankModel _$MyBankModelFromJson(Map<String, dynamic> json) {
  return MyBankModel(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MyBankModelToJson(MyBankModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
