import 'package:ai_weather_app/core/errors/dio_errors.dart';
import 'package:ai_weather_app/features/home/data/sources/remote_data_source.dart';
import 'package:ai_weather_app/features/home/domain/entities/weather_entity.dart';
import 'package:ai_weather_app/features/home/domain/repos/base_weather_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class WeatherRepoImpl implements BaseWeatherRepo {
  final WeatherBaseRemoteDataSource remoteDataSource;

  WeatherRepoImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<WeatherEntity>>> getWeatherData(
      {required String city}) async {
    try {
      var result = await remoteDataSource.getWeatherData(city: city);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
