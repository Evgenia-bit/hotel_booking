import 'package:hotel_booking/core/utils/price_format_manager.dart';
import 'package:hotel_booking/features/room/data/models/room_model.dart';
import 'package:hotel_booking/features/room/domain/entity/room.dart';

class RoomMapper {
  Room from(RoomModel model) {
    return Room(
      name: model.name,
      price: PriceFormatManager.formatPrice(model.price),
      pricePer: model.price_per,
      peculiarities: model.peculiarities,
      imageUrls: model.image_urls,
    );
  }
}
