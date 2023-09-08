import 'package:flutter/material.dart';
import 'package:hotel_booking/core/styles/colors.dart';

class TextFieldWrapper extends StatelessWidget {
  final bool isValid;
  final Widget child;
  const TextFieldWrapper({
    super.key,
    required this.child,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: isValid ? AppColors.lightestGrey1 : AppColors.red,
      ),
      child: child,
    );
  }
}
