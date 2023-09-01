import 'package:flutter/material.dart';
import 'package:hotel_booking/core/styles/colors.dart';

class Rating extends StatelessWidget {
  final int rating;
  final String ratingName;

  const Rating({
    super.key,
    required this.rating,
    required this.ratingName,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: const BoxDecoration(
        color: AppColors.yellow,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            color: AppColors.orange,
            size: 15,
          ),
          Text(
            '$rating $ratingName',
            style: textTheme.labelMedium?.copyWith(color: AppColors.orange),
          ),
        ],
      ),
    );
  }
}
