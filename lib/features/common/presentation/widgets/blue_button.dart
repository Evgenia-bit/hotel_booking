import 'package:flutter/material.dart';
import 'package:hotel_booking/core/styles/colors.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const BlueButton({
    super.key,
    required this.text,
     this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
          backgroundColor: MaterialStatePropertyAll( AppColors.blue),
        ),
        child: Text(
          text,
          style: textTheme.labelMedium?.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
