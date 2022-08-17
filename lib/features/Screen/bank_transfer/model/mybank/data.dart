import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  final int? id;

  final String? owner_name;
  final String? name;
  final String? account_number;
  final String? iban_number;
  final String? image;



  Map<String, dynamic> toJson() => _$DataToJson(this);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Data({
    required this.id,

    required this.name,
    required this.account_number,
    required this.iban_number,
    required this.owner_name,
    this.image


  });
}
