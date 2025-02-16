import 'dart:convert';

import 'condition.dart';

class Day {
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  int? maxwindMph;
  double? maxwindKph;
  int? totalprecipMm;
  int? totalprecipIn;
  int? totalsnowCm;
  int? avgvisKm;
  int? avgvisMiles;
  int? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  double? uv;

  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromMap(Map<String, dynamic> data) => Day(
        maxtempC: (data['maxtemp_c'] as num?)?.toDouble(),
        maxtempF: (data['maxtemp_f'] as num?)?.toDouble(),
        mintempC: (data['mintemp_c'] as num?)?.toDouble(),
        mintempF: (data['mintemp_f'] as num?)?.toDouble(),
        avgtempC: (data['avgtemp_c'] as num?)?.toDouble(),
        avgtempF: (data['avgtemp_f'] as num?)?.toDouble(),
        maxwindMph: data['maxwind_mph'] as int?,
        maxwindKph: (data['maxwind_kph'] as num?)?.toDouble(),
        totalprecipMm: data['totalprecip_mm'] as int?,
        totalprecipIn: data['totalprecip_in'] as int?,
        totalsnowCm: data['totalsnow_cm'] as int?,
        avgvisKm: data['avgvis_km'] as int?,
        avgvisMiles: data['avgvis_miles'] as int?,
        avghumidity: data['avghumidity'] as int?,
        dailyWillItRain: data['daily_will_it_rain'] as int?,
        dailyChanceOfRain: data['daily_chance_of_rain'] as int?,
        dailyWillItSnow: data['daily_will_it_snow'] as int?,
        dailyChanceOfSnow: data['daily_chance_of_snow'] as int?,
        condition: data['condition'] == null
            ? null
            : Condition.fromMap(data['condition'] as Map<String, dynamic>),
        uv: (data['uv'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'maxtemp_c': maxtempC,
        'maxtemp_f': maxtempF,
        'mintemp_c': mintempC,
        'mintemp_f': mintempF,
        'avgtemp_c': avgtempC,
        'avgtemp_f': avgtempF,
        'maxwind_mph': maxwindMph,
        'maxwind_kph': maxwindKph,
        'totalprecip_mm': totalprecipMm,
        'totalprecip_in': totalprecipIn,
        'totalsnow_cm': totalsnowCm,
        'avgvis_km': avgvisKm,
        'avgvis_miles': avgvisMiles,
        'avghumidity': avghumidity,
        'daily_will_it_rain': dailyWillItRain,
        'daily_chance_of_rain': dailyChanceOfRain,
        'daily_will_it_snow': dailyWillItSnow,
        'daily_chance_of_snow': dailyChanceOfSnow,
        'condition': condition?.toMap(),
        'uv': uv,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Day].
  factory Day.fromJson(String data) {
    return Day.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Day] to a JSON string.
  String toJson() => json.encode(toMap());
}
