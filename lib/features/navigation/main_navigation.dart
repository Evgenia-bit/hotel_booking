import 'package:flutter/cupertino.dart';
import 'package:hotel_booking/features/hotel/presentation/hotel_screen.dart';

abstract class MainNavigationRouteNames {
  static const hotel = '/';
  static const room = '/room';
  static const booking = '/booking';
  static const paid = '/paid';
}

class MainNavigation {
  static final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.hotel: (_) => const HotelScreen(),
    // MainNavigationRouteNames.room: (_) =>
    // MainNavigationRouteNames.booking: (_) =>
    // MainNavigationRouteNames.paid: (_) =>
  };
}
