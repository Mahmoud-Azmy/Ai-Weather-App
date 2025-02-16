import 'package:ai_weather_app/core/errors/dio_errors.dart';
import 'package:ai_weather_app/features/home/domain/entities/weather_entity.dart';
import 'package:ai_weather_app/features/home/domain/repos/base_weather_repo.dart';
import 'package:dartz/dartz.dart';

class GetWeatherDataUseCase {
  final BaseWeatherRepo baseWeatherRepo;
  GetWeatherDataUseCase(this.baseWeatherRepo);

  Future<Either<Failure, List<WeatherEntity>>> call(
          {required String city}) async =>
      await baseWeatherRepo.getWeatherData(city: city);
}
