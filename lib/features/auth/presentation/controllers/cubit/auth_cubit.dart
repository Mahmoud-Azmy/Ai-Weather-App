import 'package:ai_weather_app/core/utils/app_consts.dart';
import 'package:ai_weather_app/core/utils/service_locator.dart';
import 'package:ai_weather_app/features/auth/domain/entities/user_entity.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/login_user_use_case.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/sign_up_user_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.loginUserUseCase, this.signUpUserUseCase)
      : super(AuthInitial());
  final LoginUserUseCase loginUserUseCase;
  final SignUpUserUseCase signUpUserUseCase;
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
      (l) => emit(
        LoginErrorState(l.errorMessage),
      ),
      (token) async {
        await sl<SharedPreferences>().setString(AppConsts.kToken, token);
        emit(
          LoginSuccessState(AppConsts.successMessage),
        );
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
}
