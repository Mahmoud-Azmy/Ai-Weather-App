import 'package:ai_weather_app/core/network/api_service.dart';
import 'package:ai_weather_app/features/home/data/models/weather_model/weather_model.dart';
import 'package:ai_weather_app/features/home/domain/entities/weather_entity.dart';

abstract class WeatherBaseRemoteDataSource {
  Future<List<WeatherEntity>> getWeatherData({required String city});
}

class WeatherRemoteDataSourceImpl extends WeatherBaseRemoteDataSource {
  final ApiService apiService;

  WeatherRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<WeatherEntity>> getWeatherData({required String city}) async {
    var data = await apiService.get(city);
    List<WeatherEntity> weatherList = parseWeatherData(data);
    return weatherList;
  }

  List<WeatherEntity> parseWeatherData(Map<String, dynamic> data) {
    List<WeatherEntity> weatherList = [];
    for (var item in data['forecast']['forecastday']) {
      weatherList.add(WeatherModel.fromJson(item));
    }
    return weatherList;
  }
}
