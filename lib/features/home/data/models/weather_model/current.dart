import 'condition.dart';

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  int? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  int? pressureMb;
  int? pressureIn;
  int? precipMm;
  int? precipIn;
  int? humidity;
  int? cloud;
  int? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  int? visKm;
  int? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
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
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json['last_updated_epoch'] as int?,
        lastUpdated: json['last_updated'] as String?,
        tempC: json['temp_c'] as int?,
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
        pressureIn: json['pressure_in'] as int?,
        precipMm: json['precip_mm'] as int?,
        precipIn: json['precip_in'] as int?,
        humidity: json['humidity'] as int?,
        cloud: json['cloud'] as int?,
        feelslikeC: json['feelslike_c'] as int?,
        feelslikeF: (json['feelslike_f'] as num?)?.toDouble(),
        windchillC: (json['windchill_c'] as num?)?.toDouble(),
        windchillF: (json['windchill_f'] as num?)?.toDouble(),
        heatindexC: (json['heatindex_c'] as num?)?.toDouble(),
        heatindexF: (json['heatindex_f'] as num?)?.toDouble(),
        dewpointC: (json['dewpoint_c'] as num?)?.toDouble(),
        dewpointF: (json['dewpoint_f'] as num?)?.toDouble(),
        visKm: json['vis_km'] as int?,
        visMiles: json['vis_miles'] as int?,
        uv: (json['uv'] as num?)?.toDouble(),
        gustMph: (json['gust_mph'] as num?)?.toDouble(),
        gustKph: (json['gust_kph'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'last_updated_epoch': lastUpdatedEpoch,
        'last_updated': lastUpdated,
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
        'vis_km': visKm,
        'vis_miles': visMiles,
        'uv': uv,
        'gust_mph': gustMph,
        'gust_kph': gustKph,
      };
}
