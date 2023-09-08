import 'package:hotel_booking/core/utils/price_format_manager.dart';
import 'package:hotel_booking/features/hotel/data/models/hotel_model.dart';
import 'package:hotel_booking/features/hotel/domain/entity/hotel.dart';


class HotelMapper {
  Hotel from(HotelModel model) {
    return Hotel(
      name: model.name,
      address: model.adress,
      description: model.about_the_hotel.description,
      price: 'от ${PriceFormatManager.formatPrice(model.minimal_price)}',
      imageUrls: model.image_urls,
      priceForIt: model.price_for_it,
      rating: model.rating,
      ratingName: model.rating_name,
      peculiarities: model.about_the_hotel.peculiarities,
    );
  }
}
