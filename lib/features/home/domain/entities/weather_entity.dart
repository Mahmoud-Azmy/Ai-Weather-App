class WeatherEntity {
  final String cityName;
  final int id;
  final String description;
  final double minTemp;
  final double maxTemp;
  final double temp;
  final int humidity;
  final double windSpeed;
  final String icon;

  WeatherEntity({
    required this.cityName,
    required this.id,
    required this.description,
    required this.minTemp,
    required this.maxTemp,
    required this.temp,
    required this.humidity,
    required this.windSpeed,
    required this.icon,
  });
}
