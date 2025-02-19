import 'package:ai_weather_app/core/errors/dio_errors.dart';
import 'package:ai_weather_app/features/home/domain/entities/weather_entity.dart';
import 'package:ai_weather_app/features/home/domain/repos/base_weather_repo.dart';
import 'package:ai_weather_app/features/home/domain/use_cases/get_weather_data_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_weather_data_use_case_test.mocks.dart';

@GenerateMocks([BaseWeatherRepo])
void main() {
  late GetWeatherDataUseCase getWeatherDataUseCase;
  late MockBaseWeatherRepo mockBaseWeatherRepo;

  setUp(() {
    mockBaseWeatherRepo = MockBaseWeatherRepo();
    getWeatherDataUseCase = GetWeatherDataUseCase(mockBaseWeatherRepo);
  });

  const testCity = 'Cairo';
  final testWeatherData = [
    WeatherEntity(
      cityName: 'Cairo',
      id: 1,
      description: 'Clear Sky',
      minTemp: 22.0,
      maxTemp: 30.0,
      temp: 25.0,
      humidity: 60.0,
      windSpeed: 5.0,
      icon: '01d',
      sunrise: '06:00 AM',
      sunset: '06:00 PM',
      uv: 7.5,
      responseDate: '2025-02-19',
    )
  ];

  test('should return weather data when call is successful', () async {
    when(mockBaseWeatherRepo.getWeatherData(city: anyNamed('city')))
        .thenAnswer((_) async => Right(testWeatherData));

    final result = await getWeatherDataUseCase(city: testCity);

    expect(result, Right(testWeatherData));
    verify(mockBaseWeatherRepo.getWeatherData(city: testCity));
    verifyNoMoreInteractions(mockBaseWeatherRepo);
  });

  test('should return Failure when call fails', () async {
    final failure = ServerFailure('Failed to fetch weather data');
    when(mockBaseWeatherRepo.getWeatherData(city: anyNamed('city')))
        .thenAnswer((_) async => Left(failure));

    final result = await getWeatherDataUseCase(city: testCity);

    expect(result, Left(failure));
    verify(mockBaseWeatherRepo.getWeatherData(city: testCity));
    verifyNoMoreInteractions(mockBaseWeatherRepo);
  });
}

