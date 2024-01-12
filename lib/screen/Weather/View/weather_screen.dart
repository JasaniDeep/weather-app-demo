import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_demo_bloc/screen/Weather/Bloc/weather_bloc.dart';
import 'package:flutter_weather_demo_bloc/screen/Weather/Bloc/weather_event.dart';
import 'package:flutter_weather_demo_bloc/screen/Weather/Bloc/weather_state.dart';
import 'package:flutter_weather_demo_bloc/screen/Weather/View/show_weather_detail.dart';
import 'package:flutter_weather_demo_bloc/widget/common_snackbar.dart';
import 'package:flutter_weather_demo_bloc/widget/common_textfield.dart';
import 'package:get/get.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool isScreen = false;
  TextEditingController citySearchController =
      TextEditingController(text: "bangalore");

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    if (isScreen == false) {
      weatherBloc.add(WeatherFetchEvent(citySearchController.text));
      isScreen = true;
      setState(() {});
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: Get.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color(0xff2FBFE6).withOpacity(0.3),
            const Color(0xff2FBFE6).withOpacity(0.6),
            const Color(0xff2FBFE6)
          ], begin: Alignment.topCenter, end: AlignmentDirectional.centerEnd),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: Get.width * 0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTextField(
                title: "Search City",
                hintText: "Search City",
                controller: citySearchController,
                suffixIcon: InkWell(
                    onTap: () {
                      if (citySearchController.text.isNotEmpty) {
                        FocusScope.of(context).unfocus();
                        weatherBloc.add(WeatherFetchEvent(
                            citySearchController.text.toString()));
                      } else {
                        showSnackbar(
                            title: "title", message: "Please Enter City");
                      }
                    },
                    child: Container(
                      width: Get.width * 0.2,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(right: 16),
                      child: const Text("Search",
                          style: TextStyle(color: Colors.white)),
                    )),
                // ),
                margin: const EdgeInsets.only(left: 24, right: 24),
              ),
              Image.asset("asset/sun_cloud.png", width: Get.width * 0.6),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherIsNotSearched) {
                    return const SizedBox();
                  } else if (state is WeatherIsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is WeatherIsLoaded) {
                    return ShowWeather(
                        state.weather, citySearchController.text);
                  } else {
                    return Column(
                      children: [
                        Center(
                            child: Text(
                          "No place found as '${citySearchController.text.toString()}'",
                          style: const TextStyle(
                              fontSize: 22, color: Colors.white),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              BlocProvider.of<WeatherBloc>(context)
                                  .add(WeatherResetEvent());
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                  child: Text(
                                "Search",
                                style: TextStyle(
                                    fontSize: 21, color: Colors.cyanAccent),
                              )),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
