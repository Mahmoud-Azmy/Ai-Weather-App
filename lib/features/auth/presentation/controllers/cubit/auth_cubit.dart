import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/service_locator.dart';
import 'package:ai_weather_app/features/auth/data/models/auth_user_model.dart';
import 'package:ai_weather_app/features/auth/domain/entities/user_entity.dart';
import 'package:ai_weather_app/features/auth/domain/repos/base_auth_user_repo.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/login_user_use_case.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/reset_user_password.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/sign_up_user_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.loginUserUseCase, this.signUpUserUseCase,
      this.resetUserPasswordUseCase, this.baseAuthUserRepo)
      : super(AuthInitial());
  final LoginUserUseCase loginUserUseCase;
  final SignUpUserUseCase signUpUserUseCase;
  final ResetUserPasswordUseCase? resetUserPasswordUseCase;
  final BaseAuthUserRepo baseAuthUserRepo;
  bool isPasswordVisible = false;

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(
      ChangePasswordVisibility(isPasswordVisible),
    );
  }

  void loginUser(UserEntity user) async {
    emit(LoginLoadingState());
    var result = await loginUserUseCase.call(user);
    result.fold(
      (l) => emit(LoginErrorState(l.errorMessage)),
      (token) async {
        await sl<SharedPreferences>().setString(AppConsts.kToken, token);
        // Fetch user data and store name in SharedPreferences
        var userData = await baseAuthUserRepo.getUserData();
        userData.fold(
          (l) => debugPrint('Error fetching user dat'), // Handle error
          (user) async {
            await sl<SharedPreferences>().setString("userName", user.name);
          },
        );
        emit(LoginSuccessState(AppConsts.successMessage));
      },
    );
  }

  void signUpUser(UserEntity user) async {
    emit((SignUpLoadingState()));
    var result = await signUpUserUseCase.call(user);
    result.fold(
      (l) => emit(SignUpErrorState(l.errorMessage)),
      (r) => emit(SignUpSuccessState(r)),
    );
  }

  void resetUserPassword(UserEntity user) async {
    emit(ResetPasswordLoadingState());
    var result = await resetUserPasswordUseCase!.call(user);
    result.fold(
      (l) => emit(ResetPasswordErrorState(l.errorMessage)),
      (r) => emit(ResetPasswordSuccessState(r)),
    );
  }
}
