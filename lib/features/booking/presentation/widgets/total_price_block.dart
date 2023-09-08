import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/core/styles/colors.dart';
import 'package:hotel_booking/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:hotel_booking/features/common/presentation/widgets/block_container.dart';

class TotalPriceBlock extends StatelessWidget {
  const TotalPriceBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = context.select((BookingCubit cubit) => cubit.state.booking);

    if (booking == null) {
      return const SizedBox.shrink();
    }

    return BlockContainer(
      child: Column(
        children: [
          _PriceRow(label: 'Тур', price: booking.tourPrice),
          const SizedBox(height: 16),
          _PriceRow(label: 'Топливный сбор', price: booking.fuelCharge),
          const SizedBox(height: 16),
          _PriceRow(label: 'Сервисный сбор', price: booking.serviceCharge),
          const SizedBox(height: 16),
          _PriceRow(
            label: 'К оплате',
            price: booking.totalPrice,
            priceStyle: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final String price;
  final TextStyle? priceStyle;

  const _PriceRow({
    super.key,
    required this.label,
    required this.price,
    this.priceStyle,
  });

  @override
  Widget build(BuildContext context) {
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final priceTextStyle = priceStyle ??
        bodyLarge?.copyWith(
          color: AppColors.black,
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: bodyLarge?.copyWith(
            color: Colors.grey,
          ),
        ),
        Text(
          '$price ₽',
          style: priceTextStyle,
        ),
      ],
    );
  }
}
