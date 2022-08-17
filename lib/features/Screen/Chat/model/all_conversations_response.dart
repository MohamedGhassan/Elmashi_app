import 'package:ealmashi/features/Screen/Chat/model/data.dart';

import 'package:json_annotation/json_annotation.dart';
part 'all_conversations_response.g.dart';

@JsonSerializable()
class AllConversationsModel {


  final List<AllConverData>? data;


  Map<String, dynamic> toJson() => _$AllConversationsModelToJson(this);
  factory AllConversationsModel.fromJson(Map<String, dynamic> json) =>
      _$AllConversationsModelFromJson(json);

  AllConversationsModel(
      {
        required this.data,

      });
}
