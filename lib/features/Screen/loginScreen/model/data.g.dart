// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    user: UserDetails.fromJson(json['user'] as Map<String, dynamic>),
    subscribed_package_name: json['subscribed_package_name'] as String?,
    subscriptions: (json['subscriptions'] as List<dynamic>?)
        ?.map((e) => SubModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'user': instance.user,
      'subscriptions': instance.subscriptions,
      'subscribed_package_name': instance.subscribed_package_name,
    };
