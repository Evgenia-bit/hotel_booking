import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/common/presentation/widgets/screen.dart';
import 'package:hotel_booking/features/room/domain/repository/room_repository.dart';
import 'package:hotel_booking/features/room/presentation/cubit/room_cubit.dart';
import 'package:hotel_booking/features/room/presentation/widgets/room_block.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RoomRepository(),
      child: BlocProvider(
        create: (context) => RoomCubit(
          RepositoryProvider.of<RoomRepository>(context),
        ),
        child: Scaffold(
          body: BlocBuilder<RoomCubit, RoomState>(
            builder: (context, state) {
              final hotelName =
                  ModalRoute.of(context)?.settings.arguments as String?;

              return Screen(
                isLoading: state.loading,
                isFailed: state.failed,
                body: const _Body(),
                appBarTitle: hotelName ?? '',
                load: context.read<RoomCubit>().load,
              );
            },
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
    final roomList = context.watch<RoomCubit>().state.roomList;
    return Column(
      children: [
        const SizedBox(height: 8),
        ...roomList
            .map(
              (room) => RoomBlock(room: room),
            )
            .toList(),
      ],
    );
  }
}
