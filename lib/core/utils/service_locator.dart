import 'package:ai_weather_app/core/network/api_service.dart';
import 'package:ai_weather_app/features/auth/data/repos/auth_user_repo_impl.dart';
import 'package:ai_weather_app/features/auth/data/sources/remote_data_source.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/login_user_use_case.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/reset_user_password.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/sign_up_user_use_case.dart';
import 'package:ai_weather_app/features/home/data/repos/weather_repo_impl.dart';
import 'package:ai_weather_app/features/home/data/sources/remote_data_source.dart';
import 'package:ai_weather_app/features/home/domain/repos/base_weather_repo.dart';
import 'package:ai_weather_app/features/home/domain/use_cases/get_weather_data_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);
  // Firebase Services
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<ApiService>(() => ApiService(sl.get<Dio>()));

  sl.registerLazySingleton<WeatherBaseRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(sl.get<ApiService>()));

  sl.registerLazySingleton<BaseWeatherRepo>(() => WeatherRepoImpl(
        sl.get<WeatherBaseRemoteDataSource>(),
      ));
  sl.registerLazySingleton<GetWeatherDataUseCase>(
    () => GetWeatherDataUseCase(sl.get<BaseWeatherRepo>()),
  );
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(sl<FirebaseAuth>(), sl<FirebaseFirestore>()));

  sl.registerLazySingleton<AuthUserRepoImpl>(
      () => AuthUserRepoImpl(sl.get<RemoteDataSource>()));

  sl.registerLazySingleton<ResetUserPasswordUseCase>(
      () => ResetUserPasswordUseCase(sl.get<AuthUserRepoImpl>()));

  sl.registerLazySingleton<LoginUserUseCase>(
      () => LoginUserUseCase(sl.get<AuthUserRepoImpl>()));

  sl.registerLazySingleton<SignUpUserUseCase>(
      () => SignUpUserUseCase(sl.get<AuthUserRepoImpl>()));
}
