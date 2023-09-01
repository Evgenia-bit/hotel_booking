import 'package:json_annotation/json_annotation.dart';

part 'about_hotel_model.g.dart';

@JsonSerializable()
class AboutHotelModel {
  String description;
  List<String> peculiarities;

  AboutHotelModel({
    required this.description,
    required this.peculiarities,
  });

  factory AboutHotelModel.fromJson(Map<String, dynamic> json) =>
      _$AboutHotelModelFromJson(json);

  Map<String, dynamic> toJson() => _$AboutHotelModelToJson(this);
}
