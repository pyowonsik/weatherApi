import 'package:flutter/material.dart';
import 'package:weatherapi/constants/app_colors.dart';
import 'package:weatherapi/features/weather/city_search_box.dart';
import 'package:weatherapi/features/weather/current_weather.dart';
import 'package:weatherapi/features/weather/hourly_weather.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key, required this.city}) : super(key: key);
  final String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.rainGradient),
        ),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Spacer(),
            CitySearchBox(),
            Spacer(),
            CurrentWeather(),
            Spacer(),
            HourlyWeather(),
            Spacer(),
          ],
        )),
      ),
    );
  }
}
