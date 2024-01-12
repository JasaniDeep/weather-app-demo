// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter_weather_demo_bloc/screen/Weather/Api/weather_model.dart';
import 'package:flutter_weather_demo_bloc/screen/Weather/Api/weather_repo.dart';
import 'package:flutter_weather_demo_bloc/screen/Weather/Bloc/weather_event.dart';
import 'package:flutter_weather_demo_bloc/screen/Weather/Bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo? weatherRepo;

  WeatherBloc({required this.weatherRepo}) : super(WeatherIsNotSearched()) {
    on<WeatherFetchEvent>((event, emit) async {
      emit(WeatherIsLoading());
      try {
        WeatherModel weather = await weatherRepo!.getWeather(event.city);
        emit(WeatherIsLoaded(weather));
      } catch (e) {
        emit(WeatherIsNotLoaded());
      }
    });

    on<WeatherResetEvent>((event, emit) => emit(WeatherIsNotSearched()));
  }
}
