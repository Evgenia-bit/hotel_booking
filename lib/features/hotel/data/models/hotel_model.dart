import 'package:hotel_booking/features/hotel/data/models/about_hotel_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_model.g.dart';

@JsonSerializable()
class HotelModel {
  int id;
  String name;
  String adress;
  int minimal_price;
  String price_for_it;
  int rating;
  String rating_name;
  List<String> image_urls;
  AboutHotelModel about_the_hotel;

  HotelModel({
    required this.id,
    required this.name,
    required this.adress,
    required this.minimal_price,
    required this.price_for_it,
    required this.rating,
    required this.rating_name,
    required this.image_urls,
    required this.about_the_hotel,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) =>
      _$HotelModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelModelToJson(this);
}
