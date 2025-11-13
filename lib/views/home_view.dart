import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_cubit/weather_state.dart';
import 'package:weather_app/views/search_views.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Weather App'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchViews();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherSuccess) {
              return WeatherInfoBody(
                weather: BlocProvider.of<WeatherCubit>(context).weatherModel!,
              );
            } else if (state is WeatherFailure
            ) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    "OOP there was an error 😔 try Again ",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              );
            } else {
              return const NoWeatherBody();
              
            }
          },
        ));
  }
}
