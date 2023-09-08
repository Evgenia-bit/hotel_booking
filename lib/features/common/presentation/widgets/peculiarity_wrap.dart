import 'package:flutter/material.dart';
import 'package:hotel_booking/core/styles/colors.dart';

class PeculiarityWrap extends StatelessWidget {
  final List<String> peculiarities;

  const PeculiarityWrap({super.key, required this.peculiarities});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: peculiarities
          .map(
            (p) => _Peculiarity(
              text: p,
            ),
          )
          .toList(),
    );
  }
}

class _Peculiarity extends StatelessWidget {
  final String text;

  const _Peculiarity({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: const BoxDecoration(
        color: AppColors.lightestGrey2,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(
        text,
        style: textTheme.displayMedium?.copyWith(color: AppColors.grey),
      ),
    );
  }
}
