import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apikey = "48ea17e6665440c9bfe132805251406";

  WeatherService({required this.dio});
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apikey&q=$cityName&days=1");

      WeatherModel weatherModel = WeatherModel.formjason(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMassage = e.response?.data['error']['message'] ??
          "oops there was an error,try later";
      throw Exception(errorMassage);
    } catch (e) { 
      log(e.toString());
      throw Exception("there was an error , try later ");
    }
  }
}

