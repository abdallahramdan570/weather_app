import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Services/weather_service.dart';
import 'package:weather_app/cubit/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_cubit/weather_state.dart';
// ignore: unused_import
import 'package:weather_app/main.dart';

import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit(WeatherService(dio: Dio())),
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(WeatherService(dio: Dio())),
      child: Builder(
        builder: (context) => BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch:
                    BlocProvider.of<WeatherCubit>(context).weatherModel == null
                        ? Colors.blue
                        : BlocProvider.of<WeatherCubit>(context)
                                    .weatherModel!
                                    .weatherCondition ==
                                null
                            ? Colors.blue
                            : getThemeColor(
                                BlocProvider.of<WeatherCubit>(context)
                                    .weatherModel!
                                    .weatherCondition),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case "Sunny":
      return Colors.orange;
    case "Partly cloudy":
      return Colors.lightBlue;
    case "Cloudy":
      return Colors.blueGrey;
    case "Overcast":
      return Colors.grey;
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.blueGrey;
    case "Patchy rain possible":
    case "Light rain":
    case "Patchy light rain":
    case "Moderate rain":
    case "Heavy rain":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.blue;
    case "Patchy snow possible":
    case "Light snow":
    case "Moderate snow":
    case "Heavy snow":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.indigo;
    case "Blizzard":
      return Colors.deepPurple;
    case "Thundery outbreaks possible":
      return Colors.deepOrange;
    default:
      return Colors.blue; // Fallback color
  }
}
