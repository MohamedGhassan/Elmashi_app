import 'package:ealmashi/features/Screen/MyAccount/model/social_links/instagram_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/snapchat_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/twitter_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/whatsapp_model.dart';
import 'package:ealmashi/features/Screen/loginScreen/model/sub_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'facebook_model.dart';


part 'data.g.dart';

@JsonSerializable()
class SocialLinksData {

  final FacebookModel? facebook;
  final SnapchatModel? snapchat;
   final InstagramModel? instagram;
final TwitterModel ? twitter;
final WhatsappModel? whatsapp;

  Map<String, dynamic> toJson() => _$SocialLinksDataToJson(this);
  factory SocialLinksData.fromJson(Map<String, dynamic> json) =>
      _$SocialLinksDataFromJson(json);

  SocialLinksData(
      {
          this.facebook,
        this.instagram,
        this.snapchat,
        this.twitter,
        this.whatsapp

      });
}
