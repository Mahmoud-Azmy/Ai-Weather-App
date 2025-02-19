import 'package:ai_weather_app/features/home/domain/entities/weather_entity.dart';

import 'astro.dart';
import 'day.dart';
import 'hour.dart';

class WeatherModel extends WeatherEntity {
  String? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  WeatherModel({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  }) : super(
          cityName: 'Madrid',
          id: day?.condition?.code ?? 0,
          description: day?.condition?.text ?? '',
          minTemp: day?.mintempC ?? 0.0,
          maxTemp: day?.maxtempC ?? 0.0,
          temp: day?.avgtempC ?? 0.0,
          humidity: day?.avghumidity ?? 0.0,
          windSpeed: day?.maxwindKph ?? 0.0,
          icon: day?.condition?.icon ?? '',
          sunrise: astro?.sunrise ?? '',
          sunset: astro?.sunset ?? '',
          uv: day?.uv ?? 0.0,
          responseDate: date ?? '',
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        date: json['date'] as String?,
        dateEpoch: json['date_epoch'] as int?,
        day: json['day'] == null
            ? null
            : Day.fromJson(json['day'] as Map<String, dynamic>),
        astro: json['astro'] == null
            ? null
            : Astro.fromJson(json['astro'] as Map<String, dynamic>),
        hour: (json['hour'] as List<dynamic>?)
            ?.map((e) => Hour.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'date_epoch': dateEpoch,
        'day': day?.toJson(),
        'astro': astro?.toJson(),
        'hour': hour?.map((e) => e.toJson()).toList(),
      };
}
