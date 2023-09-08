import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/booking/domain/repository/booking_repository.dart';
import 'package:hotel_booking/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:hotel_booking/features/booking/presentation/widgets/booking_details.dart';
import 'package:hotel_booking/features/booking/presentation/widgets/buyer_details.dart';
import 'package:hotel_booking/features/booking/presentation/widgets/total_price_block.dart';
import 'package:hotel_booking/features/booking/presentation/widgets/tourists_block.dart';
import 'package:hotel_booking/features/common/presentation/widgets/block_container.dart';
import 'package:hotel_booking/features/common/presentation/widgets/bottom_button_block.dart';
import 'package:hotel_booking/features/common/presentation/widgets/hotel_info_block.dart';
import 'package:hotel_booking/features/common/presentation/widgets/screen.dart';
import 'package:hotel_booking/features/navigation/main_navigation.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => BookingRepository(),
      child: BlocProvider(
        create: (context) => BookingCubit(
          RepositoryProvider.of<BookingRepository>(context),
        ),
        child: Scaffold(
          body: BlocBuilder<BookingCubit, BookingState>(
            builder: (context, state) => Screen(
              isLoading: state.loading,
              isFailed: state.failed,
              body: const _Body(),
              appBarTitle: 'Бронирование',
              load: context.read<BookingCubit>().load,
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = context.select((BookingCubit cubit) => cubit.state.booking);

    if (booking == null) {
      return SizedBox.fromSize();
    }

    return Column(
      children: [
        const SizedBox(height: 8),
        BlockContainer(
          child: HotelDetailsBlock(
            rating: booking.hotelRating,
            ratingName: booking.ratingName,
            hotelName: booking.hotelName,
            adress: booking.hotelAddress,
          ),
        ),
        const SizedBox(height: 8),
        const BookingDetailsBlock(),
        const SizedBox(height: 8),
        const BuyerDetailsBlock(),
        const TouristsBlock(),
        const SizedBox(height: 8),
        const TotalPriceBlock(),
        const SizedBox(height: 10),
        BottomButtonBlock(
          text: 'Оплатить ${booking.totalPrice} ₽',
          onPressed: () {
            final isValid = context.read<BookingCubit>().validateForms();
            if (isValid) {
              Navigator.of(context).pushNamed(MainNavigationRouteNames.paid);
            }
          },
        ),
      ],
    );
  }
}
