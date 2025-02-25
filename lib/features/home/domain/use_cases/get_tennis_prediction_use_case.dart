import 'package:ai_weather_app/core/errors/dio_errors.dart';
import 'package:ai_weather_app/features/home/domain/entities/weather_entity.dart';
import 'package:ai_weather_app/features/home/domain/repos/base_weather_repo.dart';
import 'package:dartz/dartz.dart';

class GetTennisPredictionUseCase {
  final BaseWeatherRepo baseWeatherRepo;

  GetTennisPredictionUseCase(this.baseWeatherRepo);

  Future<Either<Failure, int>> call(WeatherEntity weather) async =>
      await baseWeatherRepo.predictTennisPlay(weather);
}
