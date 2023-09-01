import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/core/styles/colors.dart';
import 'package:hotel_booking/features/common/presentation/widgets/rating.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_cubit.dart';
import 'package:intl/intl.dart';

class CommonDataBlock extends StatelessWidget {
  const CommonDataBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bloc = context.watch<HotelCubit>();
    final hotel = bloc.state.hotel;

    if (hotel == null) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.only(
        right: 16.0,
        bottom: 16.0,
        left: 16.0,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Carousel(),
          const SizedBox(height: 16),
          Rating(rating: hotel.rating, ratingName: hotel.rating_name),
          const SizedBox(height: 8),
          Text(
            hotel.name,
            style: textTheme.headlineLarge,
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {},
            child: Text(
              hotel.adress,
              style: textTheme.labelSmall?.copyWith(color: AppColors.blue),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                'от ${NumberFormat.decimalPattern("uk-UA").format(hotel.minimal_price)} ₽',
                style: textTheme.displayLarge,
              ),
              const SizedBox(width: 8),
              Text(
                hotel.price_for_it,
                style: textTheme.bodyLarge?.copyWith(color: AppColors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Carousel extends StatefulWidget {
  const _Carousel({super.key});

  @override
  State<_Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<_Carousel> {
  int _page = 0;

  void updatePage(int page) {
    _page = page;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<HotelCubit>();
    final imageUrls = bloc.state.hotel?.image_urls;

    return SizedBox(
      height: 257,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            onPageChanged: updatePage,
            itemCount: imageUrls?.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  imageUrls?[index] ?? '',
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          _SegmentControls(
            page: _page,
            length: imageUrls?.length ?? 0,
          ),
        ],
      ),
    );
  }
}

class _SegmentControls extends StatelessWidget {
  final int page;
  final int length;

  const _SegmentControls({
    super.key,
    required this.length,
    required this.page,
  });

  List<Widget> generateSegmentControls() {
    final opacityList = [1.0, 0.22, 0.17, 0.1, 0.05];

    return List.generate(
      length,
      (index) {
        int opacityIndex;

        if (index == page) {
          opacityIndex = 0;
        } else {
          opacityIndex = min(
            opacityList.length - 1,
            max(page - index, index - page),
          );
        }

        final color = AppColors.black.withOpacity(opacityList[opacityIndex]);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.5),
          child: Icon(
            Icons.circle,
            size: 7,
            color: color,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7.5),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: generateSegmentControls(),
        ),
      ),
    );
  }
}
