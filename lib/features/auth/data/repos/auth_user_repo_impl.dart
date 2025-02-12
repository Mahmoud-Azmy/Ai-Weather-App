import 'package:ai_weather_app/core/errors/firebase_errors.dart';
import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/features/auth/data/models/auth_user_model.dart';
import 'package:ai_weather_app/features/auth/data/sources/remote_data_source.dart';
import 'package:ai_weather_app/features/auth/domain/entities/user_entity.dart';
import 'package:ai_weather_app/features/auth/domain/repos/base_auth_user_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUserRepoImpl extends BaseAuthUserRepo {
  final RemoteDataSource remoteDataSource;

  AuthUserRepoImpl(this.remoteDataSource);
  @override
  Future<Either<FirebaseFailure, String>> loginUseUser(UserEntity user) async {
    try {
      final userModel = UserModel(
        name: user.name,
        email: user.email,
        password: user.password,
      );
      var token = await remoteDataSource.loginUseUser(userModel);
      return Right(token);
    } on FirebaseAuthException catch (e) {
      return Left(
        ServerFailure.fromFirebaseException(e),
      );
    } catch (e) {
      return Left(
        ServerFailure.fromGenericFirebaseError(e),
      );
    }
  }

  @override
  Future<Either<FirebaseFailure, String>> signUpUseUser(UserEntity user) async {
    try {
      final userModel = UserModel(
        name: user.name,
        email: user.email,
        password: user.password,
      );
      await remoteDataSource.signUpUseUser(userModel);
      return Right(AppConsts.successMessageSignUp);
    } on FirebaseAuthException catch (e) {
      return Left(
        ServerFailure.fromFirebaseException(e),
      );
    } catch (e) {
      return Left(
        ServerFailure.fromGenericFirebaseError(e),
      );
    }
  }
}
