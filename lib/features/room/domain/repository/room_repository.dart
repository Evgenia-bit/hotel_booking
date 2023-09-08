import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_booking/features/room/data/data_source/room_data_source.dart';
import 'package:hotel_booking/features/room/domain/entity/room.dart';
import 'package:hotel_booking/features/room/domain/mappers/room_mapper.dart';

class RoomRepository  {
  final _roomMapper = RoomMapper();
  final _roomDataSource = RoomDataSource(GetIt.I<Dio>());

  Future<List<Room>> getRoomList() async {
    final roomListModel = await _roomDataSource.getRoomList();
    return roomListModel.rooms
        .map((roomModel) => _roomMapper.from(roomModel))
        .toList();
  }
}
