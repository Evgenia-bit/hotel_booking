import 'package:flutter/material.dart';
import 'package:hotel_booking/features/common/presentation/widgets/failed_block.dart';

class Screen extends StatelessWidget {
  final bool isLoading;
  final bool isFailed;
  final Widget body;
  final String appBarTitle;
  final Widget? appBarLeading;
  final VoidCallback load;

  const Screen({
    super.key,
    required this.isLoading,
    required this.isFailed,
    required this.body,
    required this.appBarTitle,
    this.appBarLeading,
    required this.load,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (isFailed) {
      return FailedBlock(
        load: load,
      );
    }

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 101.0,
          title: Text(
            appBarTitle,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          leading: appBarLeading,
        ),
        SliverToBoxAdapter(
          child: body,
        ),
      ],
    );
  }
}
