import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Services/weather_service.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_cubits.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class SearchViews extends StatelessWidget {
  const SearchViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            onSubmitted: (value) {
              var getweathercubit = BlocProvider.of<GetWeatherCubits>(context);
              getweathercubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 25, horizontal: 13),
              label: Text("Search"),
              hintText: "Enter the City",
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
