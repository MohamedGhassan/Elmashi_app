// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'twitter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TwitterModel _$TwitterModelFromJson(Map<String, dynamic> json) {
  return TwitterModel(
    id: json['id'] as int,
    url: json['url'] as String?,
  );
}

Map<String, dynamic> _$TwitterModelToJson(TwitterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };
