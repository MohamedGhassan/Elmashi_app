// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    name: json['name'] as String?,
    id: json['id'] as int?,
    cost: (json['cost'] as num?)?.toDouble(),
    days: json['days'] as int?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cost': instance.cost,
      'days': instance.days,
    };
