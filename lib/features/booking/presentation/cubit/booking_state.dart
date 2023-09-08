part of 'booking_cubit.dart';

class BookingState {
  Booking? booking;
  Buyer buyer;
  List<Tourist> touristList;
  bool loading;
  bool failed;

  BookingState({
    this.booking,
    this.buyer = const Buyer(),
    this.touristList = const [Tourist()],
    this.loading = true,
    this.failed = false,
  });

  BookingState copyWith({
    Booking? booking,
    Buyer? buyer,
    List<Tourist>? touristList,
    bool loading = false,
    bool failed = false,
  }) {
    return BookingState(
      booking: booking ?? this.booking,
      buyer: buyer ?? this.buyer,
      touristList: touristList ?? this.touristList,
      loading: loading,
      failed: failed,
    );
  }
}
