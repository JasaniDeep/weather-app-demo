// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:equatable/equatable.dart';

class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherFetchEvent extends WeatherEvent {
  final city;

  WeatherFetchEvent(this.city);

  @override
  List<Object> get props => [city];
}

class WeatherResetEvent extends WeatherEvent {}
