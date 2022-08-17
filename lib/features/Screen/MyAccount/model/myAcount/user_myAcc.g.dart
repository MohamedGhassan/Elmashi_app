// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_myAcc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMyaccountModel _$UserMyaccountModelFromJson(Map<String, dynamic> json) {
  return UserMyaccountModel(
    data: json['data'] == null
        ? null
        : UserDetails2.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserMyaccountModelToJson(UserMyaccountModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
