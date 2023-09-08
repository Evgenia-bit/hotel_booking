import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/core/styles/colors.dart';
import 'package:hotel_booking/features/common/presentation/widgets/block_container.dart';
import 'package:hotel_booking/features/common/presentation/widgets/blue_button.dart';
import 'package:hotel_booking/features/common/presentation/widgets/carousel.dart';
import 'package:hotel_booking/features/common/presentation/widgets/peculiarity_wrap.dart';
import 'package:hotel_booking/features/common/presentation/widgets/price_block.dart';
import 'package:hotel_booking/features/navigation/main_navigation.dart';
import 'package:hotel_booking/features/room/domain/entity/room.dart';

class RoomBlock extends StatelessWidget {
  final Room room;

  const RoomBlock({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: BlockContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Carousel(imageUrls: room.imageUrls),
            const SizedBox(height: 8),
            Text(
              room.name,
              style: textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            PeculiarityWrap(peculiarities: room.peculiarities),
            const _DetailsButton(),
            const SizedBox(height: 8),
            PriceBlock(
              isMinimumPrice: false,
              price: room.price,
              priceForIt: room.pricePer,
            ),
            const SizedBox(height: 16),
            BlueButton(
              text: 'Выбрать номер',
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(MainNavigationRouteNames.booking);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsButton extends StatelessWidget {
  const _DetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return FilledButton(
      style: const ButtonStyle(
        minimumSize: MaterialStatePropertyAll(Size.zero),
        maximumSize: MaterialStatePropertyAll(Size(double.infinity, 30)),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
        ),
        backgroundColor: MaterialStatePropertyAll(AppColors.lightBlue),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Подробнее о номере',
            style: textTheme.displayMedium?.copyWith(color: Colors.blue),
          ),
          const SizedBox(width: 10),
          SvgPicture.asset(
            'assets/icons/ic_arrow_forward.svg',
            height: 12,
            colorFilter:
                const ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}
