class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  int? moonIllumination;
  int? isMoonUp;
  int? isSunUp;

  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
        sunrise: json['sunrise'] as String?,
        sunset: json['sunset'] as String?,
        moonrise: json['moonrise'] as String?,
        moonset: json['moonset'] as String?,
        moonPhase: json['moon_phase'] as String?,
        moonIllumination: json['moon_illumination'] as int?,
        isMoonUp: json['is_moon_up'] as int?,
        isSunUp: json['is_sun_up'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'sunrise': sunrise,
        'sunset': sunset,
        'moonrise': moonrise,
        'moonset': moonset,
        'moon_phase': moonPhase,
        'moon_illumination': moonIllumination,
        'is_moon_up': isMoonUp,
        'is_sun_up': isSunUp,
      };
}
