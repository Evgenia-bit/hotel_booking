import 'package:hotel_booking/core/utils/price_format_manager.dart';
import 'package:hotel_booking/features/booking/data/models/booking_model.dart';
import 'package:hotel_booking/features/booking/domain/entity/booking.dart';

class BookingMapper {
  Booking from(BookingModel model) {
    final totalPrice =
        model.tour_price + model.fuel_charge + model.service_charge;
        
    return Booking(
      hotelName: model.hotel_name,
      hotelAddress: model.hotel_adress,
      hotelRating: model.horating,
      ratingName: model.rating_name,
      departure: model.departure,
      arrivalCountry: model.arrival_country,
      tourDateStart: model.tour_date_start,
      tourDateStop: model.tour_date_stop,
      numberOfNights: model.number_of_nights.toString(),
      room: model.room,
      nutrition: model.nutrition,
      tourPrice: PriceFormatManager.formatPrice(model.tour_price),
      fuelCharge: PriceFormatManager.formatPrice(model.fuel_charge),
      serviceCharge: PriceFormatManager.formatPrice(model.service_charge),
      totalPrice: PriceFormatManager.formatPrice(totalPrice),
    );
  }
}
