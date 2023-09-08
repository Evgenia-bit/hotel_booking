import 'package:flutter/material.dart';
import 'package:hotel_booking/core/styles/colors.dart';
import 'package:hotel_booking/features/common/presentation/widgets/rating.dart';

class HotelDetailsBlock extends StatelessWidget {
  final int rating;
  final String ratingName;
  final String hotelName;
  final String adress;

  const HotelDetailsBlock({
    super.key,
    required this.rating,
    required this.ratingName,
    required this.hotelName,
    required this.adress,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Rating(rating: rating, ratingName: ratingName),
        const SizedBox(height: 8),
        Text(
          hotelName,
          style: textTheme.headlineLarge,
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () {},
          child: Text(
            adress,
            style: textTheme.displaySmall?.copyWith(color: AppColors.blue),
          ),
        ),
      ],
    );
  }
}
