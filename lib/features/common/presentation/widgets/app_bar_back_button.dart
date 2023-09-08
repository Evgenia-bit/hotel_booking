import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: SvgPicture.asset(
        'assets/icons/ic_arrow_back.svg',
        height: 12,
      ),
    );
  }
}
