import 'dart:convert';

import 'package:flutter_weather_demo_bloc/screen/Weather/Api/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherRepo {
  Future<WeatherModel> getWeather(String cityName) async {
    final result = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=43ea6baaad7663dc17637e22ee6f78f2"));

    if (result.statusCode != 200) {
      throw Exception();
    }
    return parshedJson(result.body);
  }

  WeatherModel parshedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded;
    // final jsonWeather = jsonDecoded['main'];

    return WeatherModel.fromJson(jsonWeather);
  }
}
