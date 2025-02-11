import 'package:ai_weather_app/features/auth/data/repos/auth_user_repo_impl.dart';
import 'package:ai_weather_app/features/auth/data/sources/remote_data_source.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/login_user_use_case.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/sign_up_user_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance; // sl = service locator

void setupLocator() {
  // Firebase Services
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // Data Source
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(sl<FirebaseAuth>(), sl<FirebaseFirestore>()));

  // Repository
  sl.registerLazySingleton<AuthUserRepoImpl>(
      () => AuthUserRepoImpl(sl.get<RemoteDataSource>()));

  // UseCase
  sl.registerLazySingleton<LoginUserUseCase>(
      () => LoginUserUseCase(sl.get<AuthUserRepoImpl>()));
  sl.registerLazySingleton<SignUpUserUseCase>(
      () => SignUpUserUseCase(sl.get<AuthUserRepoImpl>()));
}
