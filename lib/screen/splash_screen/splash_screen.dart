// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_demo_bloc/screen/Weather/Api/weather_repo.dart';
import 'package:flutter_weather_demo_bloc/screen/Weather/Bloc/weather_bloc.dart';
import 'package:flutter_weather_demo_bloc/screen/Weather/View/weather_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
              create: (context) => WeatherBloc(weatherRepo: WeatherRepo()),
              child: const WeatherScreen())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          'https://img.freepik.com/premium-vector/weather-icon-comic-style-sun-cloud-rain-cartoon-vector-illustration-white-isolated-background-meteorology-splash-effect-sign-business-concept_157943-11634.jpg?w=2000',
          width: 200.0,
        ),
      ),
    );
  }
}
