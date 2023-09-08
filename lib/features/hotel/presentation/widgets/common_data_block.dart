import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/core/styles/colors.dart';
import 'package:hotel_booking/features/common/presentation/widgets/carousel.dart';
import 'package:hotel_booking/features/common/presentation/widgets/hotel_info_block.dart';
import 'package:hotel_booking/features/common/presentation/widgets/price_block.dart';
import 'package:hotel_booking/features/hotel/presentation/cubit/hotel_cubit.dart';

class CommonDataBlock extends StatelessWidget {
  const CommonDataBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final hotel = context.watch<HotelCubit>().state.hotel;

    if (hotel == null) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.only(
        right: 16.0,
        bottom: 16.0,
        left: 16.0,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Carousel(imageUrls: hotel.imageUrls),
          const SizedBox(height: 16),
          HotelDetailsBlock(
            rating: hotel.rating,
            ratingName: hotel.ratingName,
            hotelName: hotel.name,
            adress: hotel.address,
          ),
          const SizedBox(height: 16),
          PriceBlock(
            price: hotel.price,
            priceForIt: hotel.priceForIt,
            isMinimumPrice: true,
          ),
        ],
      ),
    );
  }
}
