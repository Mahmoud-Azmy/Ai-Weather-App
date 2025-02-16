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

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        timeEpoch: json['time_epoch'] as int?,
        time: json['time'] as String?,
        tempC: (json['temp_c'] as num?)?.toDouble(),
        tempF: (json['temp_f'] as num?)?.toDouble(),
        isDay: json['is_day'] as int?,
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        windMph: (json['wind_mph'] as num?)?.toDouble(),
        windKph: (json['wind_kph'] as num?)?.toDouble(),
        windDegree: json['wind_degree'] as int?,
        windDir: json['wind_dir'] as String?,
        pressureMb: json['pressure_mb'] as int?,
        pressureIn: (json['pressure_in'] as num?)?.toDouble(),
        precipMm: json['precip_mm'] as int?,
        precipIn: json['precip_in'] as int?,
        snowCm: json['snow_cm'] as int?,
        humidity: json['humidity'] as int?,
        cloud: json['cloud'] as int?,
        feelslikeC: (json['feelslike_c'] as num?)?.toDouble(),
        feelslikeF: (json['feelslike_f'] as num?)?.toDouble(),
        windchillC: (json['windchill_c'] as num?)?.toDouble(),
        windchillF: (json['windchill_f'] as num?)?.toDouble(),
        heatindexC: (json['heatindex_c'] as num?)?.toDouble(),
        heatindexF: (json['heatindex_f'] as num?)?.toDouble(),
        dewpointC: (json['dewpoint_c'] as num?)?.toDouble(),
        dewpointF: (json['dewpoint_f'] as num?)?.toDouble(),
        willItRain: json['will_it_rain'] as int?,
        chanceOfRain: json['chance_of_rain'] as int?,
        willItSnow: json['will_it_snow'] as int?,
        chanceOfSnow: json['chance_of_snow'] as int?,
        visKm: json['vis_km'] as int?,
        visMiles: json['vis_miles'] as int?,
        gustMph: (json['gust_mph'] as num?)?.toDouble(),
        gustKph: (json['gust_kph'] as num?)?.toDouble(),
        uv: json['uv'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'time_epoch': timeEpoch,
        'time': time,
        'temp_c': tempC,
        'temp_f': tempF,
        'is_day': isDay,
        'condition': condition?.toJson(),
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
}
