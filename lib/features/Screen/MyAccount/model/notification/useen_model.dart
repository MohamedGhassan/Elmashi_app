import 'package:json_annotation/json_annotation.dart';


part 'useen_model.g.dart';

@JsonSerializable()
class UnSeenData {

  int? id;
  final int? seen;
  final String? url;
  final String? content;
  final DateTime? created_at;

  Map<String, dynamic> toJson() => _$UnSeenDataToJson(this);
  factory UnSeenData.fromJson(Map<String, dynamic> json) =>
      _$UnSeenDataFromJson(json);

  UnSeenData(
      {
        required  this.id,
        required  this.seen,
        required  this.url,
        required  this.content,
        required this.created_at
      });
}
