// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_weather_demo_bloc/screen/Weather/Api/weather_model.dart';
import 'package:intl/intl.dart';

class ShowWeather extends StatelessWidget {
  final WeatherModel? weather;
  final city;

  const ShowWeather(this.weather, this.city, {super.key});

  @override
  Widget build(BuildContext context) {
    return weather == null
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                Text(
                  "${weather!.weather!.first.description}",
                  style: const TextStyle(fontSize: 32, color: Colors.white70),
                ),
                weather!.sys == null
                    ? const SizedBox()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "asset/sun_rise.png",
                                width: 40,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                DateFormat('hh:mm:s a').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                            weather!.sys!.sunrise! * 1000)
                                        .toLocal()),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )
                              // "${DateTime.fromMicrosecondsSinceEpoch(weather!.sys!.sunrise!)}"
                              // "${weather!.sys!.sunrise!}")
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "asset/sun_set.png",
                                width: 40,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                DateFormat('hh:mm:s a').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                            weather!.sys!.sunset! * 1000)
                                        .toLocal()),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff288CC3).withOpacity(0.7)),
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "Temperature of $city",
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      weather!.main == null
                          ? const SizedBox()
                          : Text(
                              "Current Temp : ${(weather!.main!.temp! - 272.5).round()}C",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white70),
                            ),
                      const SizedBox(
                        height: 4,
                      ),
                      weather!.main == null
                          ? const SizedBox()
                          : Text(
                              "Feels Like Temp : ${(weather!.main!.feelsLike! - 272.5).round()}C",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white70),
                            ),
                      const SizedBox(
                        height: 24,
                      ),
                      weather!.main == null
                          ? const SizedBox()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                dataText(
                                    title:
                                        "${(weather!.main!.tempMin! - 272.5).round()}C",
                                    subTitle: "Min Temp"),
                                dataText(
                                  title:
                                      "${(weather!.main!.tempMax! - 272.5).round()}C",
                                  subTitle: "Max Temp",
                                ),
                                dataText(
                                  title: "${weather!.main!.pressure!.round()}",
                                  subTitle: "Pressure",
                                ),
                              ],
                            ),
                      const SizedBox(
                        height: 24,
                      ),
                      weather!.main == null
                          ? const SizedBox()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                dataText(
                                    title: "${(weather!.main!.humidity!)}",
                                    subTitle: "Humidity"),
                                dataText(
                                    title: "${(weather!.wind!.speed!)} km",
                                    subTitle: "Wind Speed"),
                                dataText(
                                    title:
                                        "${(weather!.visibility! / 1000)} km",
                                    subTitle: "Visibility"),
                              ],
                            ),

                      const SizedBox(
                        height: 25,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     BlocProvider.of<WeatherBloc>(context).add(WeatherResetEvent());
                      //   },
                      //   child: Container(
                      //     height: 40,
                      //     width: 100,
                      //     decoration: BoxDecoration(
                      //         color: Color(0xff2FBFE6),
                      //         borderRadius: BorderRadius.circular(20)),
                      //     child: const Center(
                      //         child: Text(
                      //       "Search",
                      //       style: TextStyle(fontSize: 21, color: Colors.white),
                      //     )),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  dataText({String? title, String? subTitle}) {
    return Column(
      children: [
        Text(
          // "${weather.getMinTemp.round()}C",
          title!,
          style: const TextStyle(fontSize: 25, color: Colors.white),
        ),
        Text(
          subTitle!,
          style: const TextStyle(fontSize: 18, color: Colors.white70),
        )
      ],
    );
  }
}
