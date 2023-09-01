import 'package:hotel_booking/features/hotel/data/models/hotel_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'hotel_data_source.g.dart';

@RestApi(baseUrl: "https://run.mocky.io/v3/")
abstract class HotelDataSource {
  factory HotelDataSource(Dio dio, {String baseUrl}) = _HotelDataSource;

  @GET("35e0d18e-2521-4f1b-a575-f0fe366f66e3")
  Future<HotelModel> getHotel();
}