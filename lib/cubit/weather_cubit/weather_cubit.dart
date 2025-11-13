import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Services/weather_service.dart';
import 'package:weather_app/cubit/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
 
WeatherModel? weatherModel;
  WeatherService weatherService;


  WeatherCubit(this.weatherService) : super(WeatherInitialState());
  void getWeather(String cityName) async {
    emit(WeatherLoading());
    try {
  weatherModel = await weatherService.getCurrentWeather(cityName: cityName);
   emit(WeatherSuccess());
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
