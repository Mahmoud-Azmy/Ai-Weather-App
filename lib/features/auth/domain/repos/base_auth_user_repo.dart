import 'package:ai_weather_app/core/errors/firebase_errors.dart';
import 'package:ai_weather_app/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAuthUserRepo {
  Future<Either<FirebaseFailure, String>> signUpUseUser(UserEntity user);
  Future<Either<FirebaseFailure, String>> loginUseUser(UserEntity user);
}
