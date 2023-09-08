class Booking {
  final String hotelName;
  final String hotelAddress;
  final int hotelRating;
  final String ratingName;
  final String departure;
  final String arrivalCountry;
  final String tourDateStart;
  final String tourDateStop;
  final String numberOfNights;
  final String room;
  final String nutrition;
  final String tourPrice;
  final String fuelCharge;
  final String serviceCharge;
  final String totalPrice;

  const Booking({
    required this.hotelName,
    required this.hotelAddress,
    required this.hotelRating,
    required this.ratingName,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
    required this.totalPrice,
  });
}
