// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataNot _$DataNotFromJson(Map<String, dynamic> json) {
  return DataNot(
    allNotifications: (json['allNotifications'] as List<dynamic>?)
        ?.map((e) => SeenData.fromJson(e as Map<String, dynamic>))
        .toList(),
    unseenNotifications: (json['unseenNotifications'] as List<dynamic>?)
        ?.map((e) => UnSeenData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DataNotToJson(DataNot instance) => <String, dynamic>{
      'allNotifications': instance.allNotifications,
      'unseenNotifications': instance.unseenNotifications,
    };
