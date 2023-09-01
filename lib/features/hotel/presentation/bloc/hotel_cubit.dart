import 'package:bloc/bloc.dart';
import 'package:hotel_booking/features/hotel/data/models/hotel_model.dart';
import 'package:hotel_booking/features/hotel/domain/hotel_repository.dart';

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
