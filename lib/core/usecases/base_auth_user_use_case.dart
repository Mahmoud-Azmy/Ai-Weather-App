import 'package:ai_weather_app/core/errors/firebase_errors.dart';
import 'package:ai_weather_app/features/auth/data/models/auth_user_model.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAuthUserUseCase {
  Future<Either<FirebaseFailure, String>> call(UserModel user);
}
