import 'package:flutter/material.dart';
import 'package:hotel_booking/core/styles/colors.dart';
import 'package:hotel_booking/features/common/presentation/widgets/blue_button.dart';

class BottomButtonBlock extends StatelessWidget {
  final String text;

  const BottomButtonBlock({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.lighterGrey1,
          ),
        ),
      ),
      child: BlueButton(text: text),
    );
  }
}
