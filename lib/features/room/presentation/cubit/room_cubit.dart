import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/room/domain/entity/room.dart';
import 'package:hotel_booking/features/room/domain/repository/room_repository.dart';

part 'room_state.dart';

class RoomCubit extends Cubit<RoomState> {
  RoomCubit(this._repository) : super(RoomState()) {
    load();
  }

  final RoomRepository _repository;

  Future<void> load() async {
    if (state.loading == false) emit(state.copyWith(loading: true));
    try {
      final roomList = await _repository.getRoomList();
      emit(state.copyWith(roomList: roomList));
    } catch (e) {
      emit(state.copyWith(failed: true));
    }
  }
}
