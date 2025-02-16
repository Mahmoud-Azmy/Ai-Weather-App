import 'dart:convert';

import 'condition.dart';

class Hour {
  int? timeEpoch;
  String? time;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  int? pressureMb;
  double? pressureIn;
  int? precipMm;
  int? precipIn;
  int? snowCm;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  int? willItRain;
  int? chanceOfRain;
  int? willItSnow;
  int? chanceOfSnow;
  int? visKm;
  int? visMiles;
  double? gustMph;
  double? gustKph;
  int? uv;

  Hour({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.snowCm,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.gustMph,
    this.gustKph,
    this.uv,
  });

  factory Hour.fromMap(Map<String, dynamic> data) => Hour(
        timeEpoch: data['time_epoch'] as int?,
        time: data['time'] as String?,
        tempC: (data['temp_c'] as num?)?.toDouble(),
        tempF: (data['temp_f'] as num?)?.toDouble(),
        isDay: data['is_day'] as int?,
        condition: data['condition'] == null
            ? null
            : Condition.fromMap(data['condition'] as Map<String, dynamic>),
        windMph: (data['wind_mph'] as num?)?.toDouble(),
        windKph: (data['wind_kph'] as num?)?.toDouble(),
        windDegree: data['wind_degree'] as int?,
        windDir: data['wind_dir'] as String?,
        pressureMb: data['pressure_mb'] as int?,
        pressureIn: (data['pressure_in'] as num?)?.toDouble(),
        precipMm: data['precip_mm'] as int?,
        precipIn: data['precip_in'] as int?,
        snowCm: data['snow_cm'] as int?,
        humidity: data['humidity'] as int?,
        cloud: data['cloud'] as int?,
        feelslikeC: (data['feelslike_c'] as num?)?.toDouble(),
        feelslikeF: (data['feelslike_f'] as num?)?.toDouble(),
        windchillC: (data['windchill_c'] as num?)?.toDouble(),
        windchillF: (data['windchill_f'] as num?)?.toDouble(),
        heatindexC: (data['heatindex_c'] as num?)?.toDouble(),
        heatindexF: (data['heatindex_f'] as num?)?.toDouble(),
        dewpointC: (data['dewpoint_c'] as num?)?.toDouble(),
        dewpointF: (data['dewpoint_f'] as num?)?.toDouble(),
        willItRain: data['will_it_rain'] as int?,
        chanceOfRain: data['chance_of_rain'] as int?,
        willItSnow: data['will_it_snow'] as int?,
        chanceOfSnow: data['chance_of_snow'] as int?,
        visKm: data['vis_km'] as int?,
        visMiles: data['vis_miles'] as int?,
        gustMph: (data['gust_mph'] as num?)?.toDouble(),
        gustKph: (data['gust_kph'] as num?)?.toDouble(),
        uv: data['uv'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'time_epoch': timeEpoch,
        'time': time,
        'temp_c': tempC,
        'temp_f': tempF,
        'is_day': isDay,
        'condition': condition?.toMap(),
        'wind_mph': windMph,
        'wind_kph': windKph,
        'wind_degree': windDegree,
        'wind_dir': windDir,
        'pressure_mb': pressureMb,
        'pressure_in': pressureIn,
        'precip_mm': precipMm,
        'precip_in': precipIn,
        'snow_cm': snowCm,
        'humidity': humidity,
        'cloud': cloud,
        'feelslike_c': feelslikeC,
        'feelslike_f': feelslikeF,
        'windchill_c': windchillC,
        'windchill_f': windchillF,
        'heatindex_c': heatindexC,
        'heatindex_f': heatindexF,
        'dewpoint_c': dewpointC,
        'dewpoint_f': dewpointF,
        'will_it_rain': willItRain,
        'chance_of_rain': chanceOfRain,
        'will_it_snow': willItSnow,
        'chance_of_snow': chanceOfSnow,
        'vis_km': visKm,
        'vis_miles': visMiles,
        'gust_mph': gustMph,
        'gust_kph': gustKph,
        'uv': uv,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Hour].
  factory Hour.fromJson(String data) {
    return Hour.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Hour] to a JSON string.
  String toJson() => json.encode(toMap());
}
