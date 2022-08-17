import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class PoliciesData {
  final int? id;

  final String? title;
  final String? name;
  final String? content;





  Map<String, dynamic> toJson() => _$PoliciesDataToJson(this);

  factory PoliciesData.fromJson(Map<String, dynamic> json) => _$PoliciesDataFromJson(json);

  PoliciesData({
    required this.id,
    required this.name,
    required this.title,
    required this.content,



  });
}
