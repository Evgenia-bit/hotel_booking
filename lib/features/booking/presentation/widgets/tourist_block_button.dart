import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TouristBlockButton extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final String iconFileName;
  final double iconHeight;

  final VoidCallback onPressed;

  const TouristBlockButton({
    super.key,
    required this.backgroundColor,
    required this.iconColor,
    required this.iconFileName,
    required this.onPressed,
    required this.iconHeight,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        minimumSize: const MaterialStatePropertyAll(Size.zero),
        maximumSize: const MaterialStatePropertyAll(Size(32, 32)),
        padding: const MaterialStatePropertyAll(EdgeInsets.all(5)),
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
      onPressed: onPressed,
      icon: SizedBox(
        height: 32,
        width: 32,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (widget, animation) {
            final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
            return AnimatedBuilder(
              animation: rotateAnim,
              child: widget,
              builder: (context, widget) {
                final value = min(rotateAnim.value, pi / 2);
                return Transform(
                  transform: Matrix4.rotationX(value),
                  alignment: Alignment.center,
                  child: widget,
                );
              },
            );
          },
          child: SvgPicture.asset(
            'assets/icons/$iconFileName',
            key: ValueKey(iconFileName),
            height: iconHeight,
          ),
        ),
      ),
    );
  }
}
