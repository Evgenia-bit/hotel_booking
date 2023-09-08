import 'package:flutter/material.dart';
import 'package:hotel_booking/core/styles/theme.dart';
import 'package:hotel_booking/features/navigation/main_navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel booking',
      theme: createTheme(),
      routes: MainNavigation.routes,
    );
  }
}
