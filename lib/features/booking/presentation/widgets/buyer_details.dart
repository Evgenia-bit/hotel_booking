import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:hotel_booking/features/common/presentation/widgets/custom_text_field.dart';
import 'package:hotel_booking/features/common/presentation/widgets/block_container.dart';
import 'package:hotel_booking/features/common/presentation/widgets/masked_text_field.dart';
import 'package:hotel_booking/features/common/presentation/widgets/text_field_wrapper.dart';

class BuyerDetailsBlock extends StatelessWidget {
  static final formKey = GlobalKey<FormState>();

  const BuyerDetailsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cubit = context.read<BookingCubit>();
    final isValid = context.select(
      (BookingCubit cubit) => cubit.state.buyer.isValid,
    );

    return BlockContainer(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Информация о покупателе',
              style: textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            MaskedTextField(
              mask: '+7 (***) ***-**-**',
              filter: {"*": RegExp(r'[0-9]')},
              isValid: isValid || cubit.isValidPhone(),
              label: 'Номер телефона',
              inputType: TextInputType.phone,
              onChanged: context.read<BookingCubit>().changeBuyerPhone,
            ),
            const SizedBox(height: 8),
            TextFieldWrapper(
              isValid: isValid || cubit.isValidEmail(),
              child: CustomTextField(
                onChanged: cubit.changeBuyerEmail,
                inputType: TextInputType.emailAddress,
                label: 'Почта',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту',
              style: textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
