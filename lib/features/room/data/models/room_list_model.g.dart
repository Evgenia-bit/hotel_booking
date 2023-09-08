// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomListModel _$RoomListModelFromJson(Map<String, dynamic> json) =>
    RoomListModel(
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => RoomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomListModelToJson(RoomListModel instance) =>
    <String, dynamic>{
      'rooms': instance.rooms,
    };
