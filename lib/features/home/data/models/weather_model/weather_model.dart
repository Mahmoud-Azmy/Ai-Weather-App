import 'package:ai_weather_app/features/home/domain/entities/weather_entity.dart';

import 'current.dart';
import 'forecast.dart';
import 'location.dart';

class WeatherModel extends WeatherEntity {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherModel({this.location, this.current, this.forecast})
      : super(
          cityName: location?.name ?? '',
          id: current?.condition?.code ?? 0,
          description: forecast?.forecastday?[0].day?.condition?.text ?? '',
          minTemp: forecast?.forecastday?[0].day?.mintempC ?? 0.0,
          maxTemp: forecast?.forecastday?[0].day?.maxtempC ?? 0.0,
          temp: forecast?.forecastday?[0].day?.avgtempC ?? 0.0,
          humidity: forecast?.forecastday?[0].day?.avghumidity ?? 0,
          windSpeed: forecast?.forecastday?[0].day?.maxwindKph ?? 0,
          icon: forecast?.forecastday?[0].day?.condition?.icon ?? '',
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        current: json['current'] == null
            ? null
            : Current.fromJson(json['current'] as Map<String, dynamic>),
        forecast: json['forecast'] == null
            ? null
            : Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'current': current?.toJson(),
        'forecast': forecast?.toJson(),
      };
}
