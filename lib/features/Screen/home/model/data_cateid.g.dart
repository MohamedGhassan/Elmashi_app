// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_cateid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataCateId _$DataCateIdFromJson(Map<String, dynamic> json) {
  return DataCateId(
    name: json['name'] as String?,
    id: json['id'] as int?,
    category: json['category'] == null
        ? null
        : CategoryIdChildModel.fromJson(
            json['category'] as Map<String, dynamic>),
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    user: (json['user'] as List<dynamic>?)
        ?.map((e) => UserCate.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DataCateIdToJson(DataCateId instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'user': instance.user,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
