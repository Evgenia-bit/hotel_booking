import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotel_booking/core/styles/colors.dart';
import 'package:hotel_booking/features/common/presentation/widgets/app_bar_back_button.dart';
import 'package:hotel_booking/features/common/presentation/widgets/bottom_button_block.dart';

class PaidScreen extends StatelessWidget {
  const PaidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 101.0,
        leading: const AppBarBackButton(),
        title: const Text('Заказ оплачен'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final orderNum = Random().nextInt(1000000);

    return Column(
      children: [
        const SizedBox(height: 122),
        Container(
          height: 94,
          width: 94,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: AppColors.lightestGrey1,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Image.asset(
            'assets/images/patry.png',
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'Ваш заказ принят в работу',
          style: textTheme.headlineLarge,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: Text(
            'Подтверждение заказа №$orderNum может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge?.copyWith(
              color: AppColors.grey,
            ),
          ),
        ),
        const Spacer(),
        BottomButtonBlock(
          text: 'Супер!',
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        )
      ],
    );
  }
}
