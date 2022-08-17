// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialLinksData _$SocialLinksDataFromJson(Map<String, dynamic> json) {
  return SocialLinksData(
    facebook: json['facebook'] == null
        ? null
        : FacebookModel.fromJson(json['facebook'] as Map<String, dynamic>),
    instagram: json['instagram'] == null
        ? null
        : InstagramModel.fromJson(json['instagram'] as Map<String, dynamic>),
    snapchat: json['snapchat'] == null
        ? null
        : SnapchatModel.fromJson(json['snapchat'] as Map<String, dynamic>),
    twitter: json['twitter'] == null
        ? null
        : TwitterModel.fromJson(json['twitter'] as Map<String, dynamic>),
    whatsapp: json['whatsapp'] == null
        ? null
        : WhatsappModel.fromJson(json['whatsapp'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SocialLinksDataToJson(SocialLinksData instance) =>
    <String, dynamic>{
      'facebook': instance.facebook,
      'snapchat': instance.snapchat,
      'instagram': instance.instagram,
      'twitter': instance.twitter,
      'whatsapp': instance.whatsapp,
    };
