import 'package:flutter/material.dart';
import 'package:hotel_booking/features/common/presentation/widgets/blue_button.dart';

class FailedBlock extends StatelessWidget {
  final VoidCallback load;
  const FailedBlock({super.key, required this.load});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Произошла ошибка при загрузке данных',
            textAlign: TextAlign.center,
            style: textTheme.headlineLarge,
          ),
          const SizedBox(height: 32),
          BlueButton(
            text: 'Попробовать снова',
            onPressed: load,
          ),
        ],
      ),
    );
  }
}
