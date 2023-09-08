import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/core/styles/colors.dart';
import 'package:hotel_booking/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:hotel_booking/features/common/presentation/widgets/custom_text_field.dart';
import 'package:hotel_booking/features/booking/presentation/widgets/tourist_block_button.dart';
import 'package:hotel_booking/features/common/presentation/widgets/block_container.dart';
import 'package:hotel_booking/features/common/presentation/widgets/masked_text_field.dart';
import 'package:hotel_booking/features/common/presentation/widgets/text_field_wrapper.dart';
import 'package:intl/intl.dart';

class TouristDetails extends StatefulWidget {
  final int touristIndex;

  const TouristDetails({super.key, required this.touristIndex});

  @override
  State<TouristDetails> createState() => _TouristBlockState();
}

class _TouristBlockState extends State<TouristDetails> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cubit = context.read<BookingCubit>();
    final tourist = context.select(
      (BookingCubit cubit) => cubit.state.touristList[widget.touristIndex],
    );

    return BlockContainer(
      child: Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            cubit.validateBuyerForm();
          }
        },
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${tourist.label} турист',
                    style: textTheme.headlineLarge,
                  ),
                  const Spacer(),
                  TouristBlockButton(
                    backgroundColor: AppColors.lightBlue,
                    iconColor: AppColors.blue,
                    iconFileName:
                        isOpen ? 'ic_arrow_up.svg' : 'ic_arrow_down.svg',
                    iconHeight: 6,
                    onPressed: () {
                      setState(() {
                        isOpen = !isOpen;
                      });
                    },
                  ),
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: isOpen ? null : 0,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      TextFieldWrapper(
                        isValid:
                            tourist.isValid || tourist.firstName.isNotEmpty,
                        child: CustomTextField(
                          label: 'Имя',
                          onChanged: (v) {
                            cubit.changeTourist(tourist.copyWith(firstName: v));
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFieldWrapper(
                        isValid: tourist.isValid || tourist.lastName.isNotEmpty,
                        child: CustomTextField(
                          label: 'Фамилия',
                          onChanged: (v) {
                            cubit.changeTourist(tourist.copyWith(lastName: v));
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      MaskedTextField(
                        mask: "__/__/____",
                        filter: {"_": RegExp(r'[0-9]')},
                        isValid: tourist.isValid || tourist.dateOfBirth != null,
                        label: 'Дата рождения',
                        inputType: TextInputType.datetime,
                        onChanged: (v) {
                          if (v.length != 10) return;
                          final date = DateFormat("dd/MM/yyyy").parse(v);
                          cubit.changeTourist(
                              tourist.copyWith(dateOfBirth: date));
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFieldWrapper(
                        isValid:
                            tourist.isValid || tourist.citizenship.isNotEmpty,
                        child: CustomTextField(
                          label: 'Гражданство',
                          onChanged: (v) {
                            cubit.changeTourist(
                              tourist.copyWith(citizenship: v),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      MaskedTextField(
                        mask: "_______",
                        filter: {"_": RegExp(r'[0-9]')},
                        isValid:
                            tourist.isValid || tourist.passportNumber != null,
                        label: 'Номер загранпаспорта',
                        inputType: TextInputType.number,
                        onChanged: (v) {
                          if(v.length != 7) return;
                          cubit.changeTourist(
                            tourist.copyWith(passportNumber: int.parse(v)),
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      MaskedTextField(
                        mask: "__/__",
                        filter: {"_": RegExp(r'[0-9]')},
                        isValid: tourist.isValid ||
                            tourist.passportValidityPeriod != null,
                        label: 'Срок действия загранпаспорта',
                        inputType: TextInputType.datetime,
                        onChanged: (v) {
                          if (v.length != 5) return;
                          final date = DateFormat("MM/yy").parse(v);
                          cubit.changeTourist(
                            tourist.copyWith(passportValidityPeriod: date),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
