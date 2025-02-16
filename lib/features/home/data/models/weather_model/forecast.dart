import 'forecastday.dart';

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: (json['forecastday'] as List<dynamic>?)
            ?.map((e) => Forecastday.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'forecastday': forecastday?.map((e) => e.toJson()).toList(),
      };
}
