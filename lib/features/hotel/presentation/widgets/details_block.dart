import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/core/styles/colors.dart';
import 'package:hotel_booking/features/common/presentation/widgets/block_container.dart';
import 'package:hotel_booking/features/common/presentation/widgets/peculiarity_wrap.dart';
import 'package:hotel_booking/features/hotel/presentation/cubit/hotel_cubit.dart';

class DetailsBlock extends StatelessWidget {
  const DetailsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final hotel = context.watch<HotelCubit>().state.hotel;

    if (hotel == null) {
      return const SizedBox.shrink();
    }

    return BlockContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Об отеле', style: textTheme.headlineLarge),
          const SizedBox(height: 16),
          PeculiarityWrap(peculiarities: hotel.peculiarities),
          const SizedBox(height: 12),
          Text(
            hotel.description,
            style: textTheme.bodyLarge?.copyWith(
              color: AppColors.black.withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 16),
          const _AdditionalInfoList(),
        ],
      ),
    );
  }
}

class _AdditionalInfoList extends StatelessWidget {
  const _AdditionalInfoList({super.key});

  @override
  Widget build(BuildContext context) {
    final additionalInformationList = [
      const _AdditionalInfoButton(
        title: 'Удобства',
        svgFileName: 'ic_smile.svg',
      ),
      const _AdditionalInfoButton(
        title: 'Удобства',
        svgFileName: 'ic_check_mark.svg',
      ),
      const _AdditionalInfoButton(
        title: 'Что не включено',
        svgFileName: 'ic_cross.svg',
      ),
    ];

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: AppColors.lightestGrey2,
      ),
      child: ListView.separated(
        padding: const EdgeInsets.all(15),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => additionalInformationList[index],
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 36),
          child: Divider(
            height: 1,
            thickness: 1,
            color: AppColors.darkGrey,
          ),
        ),
        itemCount: additionalInformationList.length,
      ),
    );
  }
}

class _AdditionalInfoButton extends StatelessWidget {
  final String title;
  final String svgFileName;

  const _AdditionalInfoButton({
    super.key,
    required this.title,
    required this.svgFileName,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/$svgFileName',
            height: 24,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.displayMedium
                    ?.copyWith(color: AppColors.darkerGrey),
              ),
              const SizedBox(height: 2),
              Text(
                'Самое необходимое',
                style: textTheme.displaySmall?.copyWith(color: AppColors.grey),
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/icons/ic_arrow_forward.svg',
            height: 12,
          ),
          const SizedBox(width: 6),
        ],
      ),
    );
  }
}
