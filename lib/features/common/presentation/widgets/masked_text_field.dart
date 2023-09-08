import 'package:flutter/material.dart';
import 'package:hotel_booking/core/styles/colors.dart';
import 'package:hotel_booking/features/common/presentation/widgets/custom_text_field.dart';
import 'package:hotel_booking/features/common/presentation/widgets/text_field_wrapper.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class MaskedTextField extends StatefulWidget {
  final String mask;
  final Map<String, RegExp>? filter;
  final bool isValid;
  final String label;
  final TextInputType inputType;
  final void Function(String)? onChanged;

  const MaskedTextField({
    super.key,
    required this.mask,
    required this.filter,
    required this.isValid,
    required this.label,
    required this.inputType,
    required this.onChanged,
  });

  @override
  State<MaskedTextField> createState() => _MaskedTextFieldState();
}

class _MaskedTextFieldState extends State<MaskedTextField> {
  bool _showMask = false;

  late final TextEditingController _hintController;
  final TextEditingController _valueController = TextEditingController();

  @override
  void initState() {
    _hintController = TextEditingController(text: widget.mask);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        _showMask = hasFocus;
        setState(() {});
      },
      child: TextFieldWrapper(
        isValid: widget.isValid,
        child: Stack(
          children: [
            if (_showMask)
              IgnorePointer(
                child: CustomTextField(
                  controller: _hintController,
                  textColor: AppColors.grey,
                ),
              ),
            CustomTextField(
              label: widget.label,
              controller: _valueController,
              inputType: widget.inputType,
              inputFormatters: [
                MaskTextInputFormatter(
                  mask: widget.mask,
                  filter: widget.filter,
                ),
              ],
              onChanged: (val) {
                _hintController.text = val + widget.mask.substring(val.length);
                widget.onChanged?.call(val);
              },
            ),
          ],
        ),
      ),
    );
  }
}
