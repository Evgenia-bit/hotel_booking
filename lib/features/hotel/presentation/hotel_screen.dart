import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/common/presentation/widgets/bottom_button_block.dart';
import 'package:hotel_booking/features/common/presentation/widgets/screen.dart';
import 'package:hotel_booking/features/hotel/domain/repository/hotel_repository.dart';
import 'package:hotel_booking/features/hotel/presentation/cubit/hotel_cubit.dart';
import 'package:hotel_booking/features/hotel/presentation/widgets/common_data_block.dart';
import 'package:hotel_booking/features/hotel/presentation/widgets/details_block.dart';
import 'package:hotel_booking/features/navigation/main_navigation.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => HotelRepository(),
      child: BlocProvider(
        create: (context) => HotelCubit(
          RepositoryProvider.of<HotelRepository>(context),
        ),
        child: Scaffold(
          body: BlocBuilder<HotelCubit, HotelState>(
            builder: (context, state) => Screen(
              isLoading: state.loading,
              isFailed: state.failed,
              body: const _Body(),
              appBarTitle: 'Отель',
              load: context.read<HotelCubit>().load,
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
    final name = context.watch<HotelCubit>().state.hotel?.name;
    return Column(
      children: [
        const CommonDataBlock(),
        const SizedBox(height: 8),
        const DetailsBlock(),
        const SizedBox(height: 12),
        BottomButtonBlock(
          text: 'К выбору номера',
          onPressed: () {
            Navigator.of(context).pushNamed(
              MainNavigationRouteNames.room,
              arguments: name,
            );
          },
        ),
      ],
    );
  }
}
