import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class AboutUSData {
  final int? id;

  final String? title;
  final String? name;
  final String? content;





  Map<String, dynamic> toJson() => _$AboutUSDataToJson(this);

  factory AboutUSData.fromJson(Map<String, dynamic> json) => _$AboutUSDataFromJson(json);

  AboutUSData({
    required this.id,
    required this.name,
    required this.title,
    required this.content,



  });
}
