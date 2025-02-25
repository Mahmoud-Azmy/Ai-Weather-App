class WeatherEntity {
  final String cityName;
  final int id;
  final String description;
  final double minTemp;
  final double maxTemp;
  final double temp;
  final double humidity;
  final double windSpeed;
  final String icon;
  final String sunrise;
  final String sunset;
  final double uv;
  final String responseDate;

  WeatherEntity(
      {required this.cityName,
      required this.id,
      required this.description,
      required this.minTemp,
      required this.maxTemp,
      required this.temp,
      required this.humidity,
      required this.windSpeed,
      required this.icon,
      required this.sunrise,
      required this.sunset,
      required this.uv,
      required this.responseDate});

  List<int> toTennisModelInput() {
    // Logic to convert weather data to binary values
    int outlookIsRainy = description.toLowerCase().contains('rain') ? 1 : 0;
    int outlookIsSunny = description.toLowerCase().contains('sunny') ? 1 : 0;
    int temperatureIsHot =
        temp > 25.0 ? 1 : 0; // Example threshold for "hot" (25°C)
    int temperatureIsMild =
        temp >= 15.0 && temp <= 25.0 ? 1 : 0; // Example range for "mild"
    int humidityIsNormal =
        humidity <= 60.0 ? 1 : 0; // Example threshold for "normal" humidity

    return [
      outlookIsRainy,
      outlookIsSunny,
      temperatureIsHot,
      temperatureIsMild,
      humidityIsNormal,
    ];
  }
}
