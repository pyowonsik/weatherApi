library forecast;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weatherapi/models/weather/weather.dart';

part 'forecast.g.dart';
part 'forecast.freezed.dart';

@freezed
class Forecast with _$Forecast {
  factory Forecast({
    required List<Weather> list,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}
