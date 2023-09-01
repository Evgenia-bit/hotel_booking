import 'package:dio/dio.dart';
import 'package:hotel_booking/features/hotel/data/data_source/hotel_data_source.dart';
import 'package:hotel_booking/features/hotel/data/models/hotel_model.dart';

class HotelRepository {
  final _hotelDataSource =
      HotelDataSource(Dio(BaseOptions(contentType: 'application/json')));

 Future<HotelModel> getHotel() async{
    return await  _hotelDataSource.getHotel();
  }
}
