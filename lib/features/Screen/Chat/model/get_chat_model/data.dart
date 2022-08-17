import 'package:json_annotation/json_annotation.dart';



part 'data.g.dart';

@JsonSerializable()
class Data {


  final int? id;
  final int? conversation_id;
  final String? content;
  final int? is_read;
  final int? is_from_user;
  final String? created_at;

  Map<String, dynamic> toJson() => _$DataToJson(this);
  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Data(
      {
        required  this.conversation_id,
        required  this.id,
        required this.content,
        required this.is_read,
        required this.is_from_user,
        required this.created_at
      });
}
