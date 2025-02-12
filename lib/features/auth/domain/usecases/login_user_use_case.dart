import 'package:ai_weather_app/core/errors/firebase_errors.dart';
import 'package:ai_weather_app/core/usecases/base_auth_user_use_case.dart';
import 'package:ai_weather_app/features/auth/domain/entities/user_entity.dart';
import 'package:ai_weather_app/features/auth/domain/repos/base_auth_user_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUserUseCase extends BaseAuthUserUseCase {
  final BaseAuthUserRepo baseAuthUserRepo;

  LoginUserUseCase(this.baseAuthUserRepo);
  @override
  Future<Either<FirebaseFailure, String>> call(UserEntity user) async {
    return await baseAuthUserRepo.loginUseUser(user);
  }
}
