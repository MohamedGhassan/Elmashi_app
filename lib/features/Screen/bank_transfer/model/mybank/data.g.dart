// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as int?,
    name: json['name'] as String?,
    account_number: json['account_number'] as String?,
    iban_number: json['iban_number'] as String?,
    owner_name: json['owner_name'] as String?,
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'owner_name': instance.owner_name,
      'name': instance.name,
      'account_number': instance.account_number,
      'iban_number': instance.iban_number,
      'image': instance.image,
    };
