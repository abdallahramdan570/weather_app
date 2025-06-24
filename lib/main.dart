import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_cubits.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider( 
      create: (context) => GetWeatherCubits(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubits, WeatherState>
        (
          builder: (context, state) {
    
            return MaterialApp(
            debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubits>(context)
                        .weatherModel
                        ?.weatherCondition),
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