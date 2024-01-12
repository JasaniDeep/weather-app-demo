// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:equatable/equatable.dart';

class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final weather;

  WeatherIsLoaded(this.weather);

  @override
  List<Object?> get props => [weather];
}

class WeatherIsNotLoaded extends WeatherState {}
