import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/core/styles/colors.dart';
import 'package:hotel_booking/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:hotel_booking/features/booking/presentation/widgets/tourist_block_button.dart';
import 'package:hotel_booking/features/common/presentation/widgets/block_container.dart';

class AddTouristBlock extends StatelessWidget {
  const AddTouristBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlockContainer(
      child: Row(
        children: [
          Text(
            'Добавить туриста',
            style: textTheme.headlineLarge,
          ),
          const Spacer(),
          TouristBlockButton(
            backgroundColor: AppColors.blue,
            iconColor: AppColors.white,
            iconHeight: 24,
            iconFileName: 'ic_add.svg',
            onPressed: context.read<BookingCubit>().addTourist,
          ),
        ],
      ),
    );
  }
}
