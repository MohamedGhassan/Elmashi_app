// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails2 _$UserDetails2FromJson(Map<String, dynamic> json) {
  return UserDetails2(
    subscriptions: (json['subscriptions'] as List<dynamic>?)
        ?.map((e) => SubModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    subscribed_package_name: json['subscribed_package_name'] as String?,
    user: json['user'] == null
        ? null
        : UserObjectModel.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserDetails2ToJson(UserDetails2 instance) =>
    <String, dynamic>{
      'user': instance.user,
      'subscriptions': instance.subscriptions,
      'subscribed_package_name': instance.subscribed_package_name,
    };
