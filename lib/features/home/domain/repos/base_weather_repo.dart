import 'package:ai_weather_app/core/errors/dio_errors.dart';
import 'package:ai_weather_app/features/home/domain/entities/weather_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseWeatherRepo {
  Future<Either<Failure, List<WeatherEntity>>> getWeatherData(
      {required String city});
  Future<Either<Failure, int>> predictTennisPlay(WeatherEntity weather);
}
