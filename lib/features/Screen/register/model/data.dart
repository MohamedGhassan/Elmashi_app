import 'package:json_annotation/json_annotation.dart';


part 'data.g.dart';

@JsonSerializable()
class Data {



  final String? name;
  final String? email;
  final String? phone;
  final int? id;
  Map<String, dynamic> toJson() => _$DataToJson(this);
  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Data(
      {

        this.name,
        this.phone,
        this.id,
        this.email
      });
}
