import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/core/styles/colors.dart';
import 'package:hotel_booking/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:hotel_booking/features/common/presentation/widgets/block_container.dart';

class BookingDetailsBlock extends StatelessWidget {
  const BookingDetailsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = context.select((BookingCubit cubit) => cubit.state.booking);
    if (booking == null) {
      return const SizedBox.shrink();
    }
    final bookingMap = {
      'Вылет из': booking.departure,
      'Страна, город': booking.arrivalCountry,
      'Даты': '${booking.tourDateStart} – ${booking.tourDateStop}',
      'Кол-во ночей': booking.numberOfNights,
      'Отель': booking.hotelName,
      'Номер': booking.room,
      'Питание': booking.nutrition,
    };

    return BlockContainer(
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) => _Item(
          entry: bookingMap.entries.elementAt(index),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: bookingMap.length,
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final MapEntry<String, String> entry;
  const _Item({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140,
          child: Text(
            entry.key,
            style: textStyle?.copyWith(color: AppColors.grey),
          ),
        ),
        Expanded(
          child: Text(
            entry.value,
            style: textStyle?.copyWith(color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
