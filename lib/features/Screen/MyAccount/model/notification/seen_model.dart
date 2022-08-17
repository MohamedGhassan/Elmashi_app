import 'package:json_annotation/json_annotation.dart';


part 'seen_model.g.dart';

@JsonSerializable()
class SeenData {

  int? id;
  final int? seen;
  final String? url;
  final String? content;
  final DateTime? created_at;


  Map<String, dynamic> toJson() => _$SeenDataToJson(this);
  factory SeenData.fromJson(Map<String, dynamic> json) =>
      _$SeenDataFromJson(json);

  SeenData(
      {
        required  this.id,
        required  this.seen,
        required  this.url,
        required  this.content,
        required this.created_at
      });
}
