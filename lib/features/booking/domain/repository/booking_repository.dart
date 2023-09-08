import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking/features/booking/data/data_source/booking_data_source.dart';
import 'package:hotel_booking/features/booking/domain/entity/booking.dart';
import 'package:hotel_booking/features/booking/domain/mappers/booking_mapper.dart';

class BookingRepository {
  final _bookingMapper = BookingMapper();
  final _bookingDataSource = BookingDataSource(GetIt.I<Dio>());

  Future<Booking> getBookingData() async {
    final model = await _bookingDataSource.getBookingData();
    return _bookingMapper.from(model);
  }
}
