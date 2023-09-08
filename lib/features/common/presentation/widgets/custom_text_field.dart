import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking/core/styles/colors.dart';


class CustomTextField extends StatelessWidget {
  final String label;
  final void Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final Color textColor;
  final TextInputType? inputType;

  const CustomTextField({
    super.key,
    this.label = '',
    this.onChanged,
    this.onEditingComplete,
    this.inputFormatters,
    this.controller,
    this.textColor = AppColors.darkestGrey,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      inputFormatters: inputFormatters,
      style: textTheme.bodyLarge?.copyWith(
        color: textColor,
      ),
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelStyle: textTheme.labelLarge,
        floatingLabelStyle: textTheme.bodySmall,
        labelText: label,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
      ),
    );
  }
}
