import 'package:flutter/material.dart';
import 'package:hotel_booking/core/styles/colors.dart';

class BlockContainer extends StatelessWidget {
  final Widget child;

  const BlockContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: child,
    );
  }
}
