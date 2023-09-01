import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/core/styles/colors.dart';
import 'package:hotel_booking/features/hotel/presentation/bloc/hotel_cubit.dart';

class DetailsBlock extends StatelessWidget {
  const DetailsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bloc = context.watch<HotelCubit>();
    final aboutTheHotel = bloc.state.hotel?.about_the_hotel;

    if (aboutTheHotel == null) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Об отеле', style: textTheme.headlineLarge),
          const SizedBox(height: 16),
          const _PeculiarityList(),
          const SizedBox(height: 12),
          Text(
            aboutTheHotel.description,
            style: textTheme.bodyLarge?.copyWith(
              color: AppColors.black.withOpacity(0.9),
            ),
          ),
          const _AdditionalInfoList(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _PeculiarityList extends StatelessWidget {
  const _PeculiarityList({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<HotelCubit>();
    final peculiarities = bloc.state.hotel?.about_the_hotel.peculiarities;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: peculiarities
              ?.map(
                (p) => _Peculiarity(
                  text: p,
                ),
              )
              .toList() ??
          [],
    );
  }
}

class _Peculiarity extends StatelessWidget {
  final String text;

  const _Peculiarity({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: const BoxDecoration(
        color: AppColors.lightestGrey,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(
        text,
        style: textTheme.labelMedium?.copyWith(color: AppColors.grey),
      ),
    );
  }
}

class _AdditionalInfoList extends StatelessWidget {
  const _AdditionalInfoList({super.key});

  @override
  Widget build(BuildContext context) {
    final additionalInformationList = [
      const _AdditionalInformationButton(
        title: 'Удобства',
        imageFileName: 'smile.png',
      ),
      const _AdditionalInformationButton(
        title: 'Удобства',
        imageFileName: 'check_mark.png',
      ),
      const _AdditionalInformationButton(
        title: 'Что не включено',
        imageFileName: 'cross.png',
      ),
    ];

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: AppColors.lightestGrey,
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

class _AdditionalInformationButton extends StatelessWidget {
  final String title;
  final String imageFileName;

  const _AdditionalInformationButton({
    super.key,
    required this.title,
    required this.imageFileName,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Image.asset(
            'assets/images/$imageFileName',
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.labelMedium
                    ?.copyWith(color: AppColors.darkerGrey),
              ),
              const SizedBox(height: 2),
              Text(
                'Самое необходимое',
                style: textTheme.labelSmall?.copyWith(color: AppColors.grey),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 24,
            color: AppColors.darkerGrey,
          ),
        ],
      ),
    );
  }
}
