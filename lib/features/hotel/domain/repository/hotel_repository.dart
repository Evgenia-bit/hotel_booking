import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking/features/hotel/data/data_source/hotel_data_source.dart';

import 'package:hotel_booking/features/hotel/domain/entity/hotel.dart';
import 'package:hotel_booking/features/hotel/domain/mappers/hotel_mapper.dart';

class HotelRepository  {
  final _hotelMapper = HotelMapper();
  final _hotelDataSource =
      HotelDataSource(GetIt.I<Dio>());

 Future<Hotel> getHotel() async{
    final model = await  _hotelDataSource.getHotel();
    return  _hotelMapper.from(model);
  }
}
