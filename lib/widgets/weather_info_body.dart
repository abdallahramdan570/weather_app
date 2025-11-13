import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit/weather_cubit.dart';

import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherMobel =
        BlocProvider.of<WeatherCubit>(context).weatherModel!;
    weatherMobel.image.contains("https");

    return Container(
     decoration: BoxDecoration(

      gradient: LinearGradient(
       colors: [
        getThemeColor(weatherMobel.weatherCondition),
            getThemeColor(weather.weatherCondition).shade300,
            getThemeColor(weather.weatherCondition).shade100,
          ],
      
      begin: Alignment.topCenter ,
      end: Alignment.bottomCenter)  
     ), 

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherMobel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              "updated at ${weatherMobel.date.hour}:${weatherMobel.date.minute}",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "https:${weatherMobel.image}",
                  height: 100,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                Text(
                  weatherMobel.temp.round().toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "MaxTemp :${weatherMobel.maxtemp.round()}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      " MinTemp :${weatherMobel.mintemp.round()} ",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherMobel.weatherCondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
