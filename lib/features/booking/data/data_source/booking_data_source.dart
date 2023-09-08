import 'package:hotel_booking/features/booking/data/models/booking_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'booking_data_source.g.dart';

@RestApi(baseUrl: "https://run.mocky.io/v3/")
abstract class BookingDataSource {
  factory BookingDataSource(Dio dio, {String baseUrl}) = _BookingDataSource;

  @GET("e8868481-743f-4eb2-a0d7-2bc4012275c8")
  Future<BookingModel> getBookingData();
}