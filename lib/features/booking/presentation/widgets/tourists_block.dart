import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/booking/domain/entity/tourist.dart';
import 'package:hotel_booking/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:hotel_booking/features/booking/presentation/widgets/add_tourist_block.dart';
import 'package:hotel_booking/features/booking/presentation/widgets/tourist_details.dart';

class TouristsBlock extends StatelessWidget {
  const TouristsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final touristList = context.select(
      (BookingCubit cubit) => cubit.state.touristList,
    );

    return Column(
      children: [
        ..._widgetsList(touristList),
        if (touristList.length < 20) ...[
          const SizedBox(height: 8),
          const AddTouristBlock(),
        ],
      ],
    );
  }

  List<Widget> _widgetsList(List<Tourist> touristList) {
    List<Widget> touristDetailsList = [];
    for (var t in touristList) {
      touristDetailsList.addAll(
        [
          const SizedBox(height: 8),
          TouristDetails(touristIndex: t.index),
        ],
      );
    }
    return touristDetailsList;
  }
}
