import 'package:flutter/material.dart';
import 'package:hotel_booking/core/styles/colors.dart';


class PriceBlock extends StatelessWidget {
  final String price;
  final String priceForIt;
  final bool isMinimumPrice;

  const PriceBlock({
    super.key,
    required this.price,
    required this.priceForIt,
  required  this.isMinimumPrice,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Text(
          '$price ₽',
          style: textTheme.displayLarge,
        ),
        const SizedBox(width: 8),
        Text(
          priceForIt,
          style: textTheme.bodyLarge?.copyWith(color: AppColors.grey),
        )
      ],
    );
  }
}
