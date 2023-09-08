import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/hotel/domain/entity/hotel.dart';
import 'package:hotel_booking/features/hotel/domain/repository/hotel_repository.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit(this._repository) : super(HotelState()) {
    load();
  }

  final HotelRepository _repository;

  Future<void> load() async {
    if (state.loading == false) emit(state.copyWith(loading: true));
    try {
      final hotel = await _repository.getHotel();
      emit(state.copyWith(hotel: hotel));
    } catch(e) {
      emit(state.copyWith(failed: true));
    }
  }
}
