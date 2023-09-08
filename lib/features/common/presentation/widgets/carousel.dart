import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotel_booking/core/styles/colors.dart';

class Carousel extends StatefulWidget {
  final List<String> imageUrls;

  const Carousel({super.key, required this.imageUrls});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _page = 0;

  void updatePage(int page) {
    _page = page;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 257,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: PageView.builder(
              onPageChanged: updatePage,
              itemCount: widget.imageUrls.length,
              itemBuilder: (context, index) {
                return Image.network(
                  widget.imageUrls[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, _, st) {
                    return Image.asset('assets/images/no_image.jpg');
                  },
                );
              },
            ),
          ),
          _SegmentControls(
            page: _page,
            length: widget.imageUrls.length,
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
