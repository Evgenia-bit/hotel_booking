// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_hotel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutHotelModel _$AboutHotelModelFromJson(Map<String, dynamic> json) =>
    AboutHotelModel(
      description: json['description'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AboutHotelModelToJson(AboutHotelModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'peculiarities': instance.peculiarities,
    };
