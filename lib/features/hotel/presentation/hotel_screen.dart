import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/common/presentation/widgets/blue_button.dart';
import 'package:hotel_booking/features/common/presentation/widgets/bottom_button_block.dart';
import 'package:hotel_booking/features/common/presentation/widgets/failed_block.dart';
import 'package:hotel_booking/features/hotel/domain/hotel_repository.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_cubit.dart';
import 'package:hotel_booking/features/hotel/presentation/widgets/common_data_block.dart';
import 'package:hotel_booking/features/hotel/presentation/widgets/details_block.dart';

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
            builder: (context, state) {
              if (state.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.failed) {
                return FailedBlock(
                  load: context.read<HotelCubit>().load,
                );
              }
              return const CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 101.0,
                    toolbarHeight: 101.0,
                    title: Text('Отель'),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        CommonDataBlock(),
                        SizedBox(height: 8),
                        DetailsBlock(),
                        SizedBox(height: 12),
                        BottomButtonBlock(text: 'К выбору номера'),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
