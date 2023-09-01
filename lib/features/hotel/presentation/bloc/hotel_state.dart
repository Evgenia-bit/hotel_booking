part of 'hotel_cubit.dart';


class HotelState {
  HotelModel? hotel;
  bool loading;
  bool failed;

  HotelState({this.hotel, this.loading = true, this.failed = false});

  HotelState copyWith({
    HotelModel? hotel,
    bool loading = false,
    bool failed = false,
  }) {
    return HotelState(
      hotel: hotel ?? this.hotel,
      loading: loading,
      failed: failed,
    );
  }
}

