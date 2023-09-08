import 'package:hotel_booking/features/room/data/models/room_list_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'room_data_source.g.dart';

@RestApi(baseUrl: "https://run.mocky.io/v3/")
abstract class RoomDataSource {
  factory RoomDataSource(Dio dio, {String baseUrl}) = _RoomDataSource;

  @GET("f9a38183-6f95-43aa-853a-9c83cbb05ecd")
  Future<RoomListModel> getRoomList();
}