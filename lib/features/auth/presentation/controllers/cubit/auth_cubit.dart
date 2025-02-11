import 'package:ai_weather_app/features/auth/domain/entities/user_entity.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/login_user_use_case.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/sign_up_user_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
      (l) => emit(LoginErrorState(l.errorMessage)),
      (r) => emit(LoginSuccessState(r)),
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
