import 'package:flutter/material.dart';
import 'package:hotel_booking/core/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          SvgPicture.asset(
            'assets/icons/ic_star.svg',
            height: 15,
          ),
          const SizedBox(width: 2),
          Text(
            '$rating $ratingName',
            style: textTheme.displayMedium?.copyWith(color: AppColors.orange),
          ),
        ],
      ),
    );
  }
}
