import 'package:intl/intl.dart';

class PriceFormatManager {
  static String formatPrice(int price) {
    return NumberFormat.decimalPattern("uk-UA").format(price);
  }
}