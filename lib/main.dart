import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/features/app/app.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<Dio>(Dio());
  runApp(const App());
}

