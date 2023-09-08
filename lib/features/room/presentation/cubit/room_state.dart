part of 'room_cubit.dart';

class RoomState {
  bool loading;
  bool failed;
  List<Room> roomList;

  RoomState({
    this.loading = true,
    this.failed = false,
    this.roomList = const [],
  });

  RoomState copyWith({
    bool loading = false,
    bool failed = false,
    List<Room>? roomList,
  }) {
    return RoomState(
      loading: loading,
      failed: failed,
      roomList: roomList ?? this.roomList,
    );
  }
}
