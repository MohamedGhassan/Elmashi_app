// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_links_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialLinksModel _$SocialLinksModelFromJson(Map<String, dynamic> json) {
  return SocialLinksModel(
    data: json['data'] == null
        ? null
        : SocialLinksData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SocialLinksModelToJson(SocialLinksModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
