import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Services/weather_service.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/search_views.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

class GetWeatherCubits extends Cubit<WeatherState> {
  GetWeatherCubits() : super(WeatherInitialState());

   WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
     weatherModel = await WeatherService(dio: Dio())
          .getCurrentWeather(cityName: cityName);

      emit(
        WeatherLoadedState(weatherModel!),
      );
    } catch (e) {
      emit(
        WeatherFailureState(e.toString()),
      );
    }
  }
}
