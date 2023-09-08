import 'package:hotel_booking/features/room/data/models/room_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_list_model.g.dart';

@JsonSerializable()
class RoomListModel {
  List<RoomModel> rooms;

  RoomListModel({
    required this.rooms,
  });

  factory RoomListModel.fromJson(Map<String, dynamic> json) =>
      _$RoomListModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomListModelToJson(this);
}
