part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class ChangePasswordVisibility extends AuthState {
  final bool isVisible;

  ChangePasswordVisibility(this.isVisible);

  @override
  List<Object> get props => [isVisible];
}

class LoginLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends AuthState {
  final String message;

  LoginSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class LoginErrorState extends AuthState {
  final String message;

  LoginErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class SignUpLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class SignUpSuccessState extends AuthState {
  final String message;
  SignUpSuccessState(this.message);
  @override
  List<Object> get props => [message];
}

class SignUpErrorState extends AuthState {
  final String message;
  SignUpErrorState(this.message);
  @override
  List<Object> get props => [message];
}

class ResetPasswordLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class ResetPasswordErrorState extends AuthState {
  final String message;
  ResetPasswordErrorState(this.message);
  @override
  List<Object> get props => [message];
}

class ResetPasswordSuccessState extends AuthState {
  final String message;
  ResetPasswordSuccessState(this.message);
  @override
  List<Object> get props => [message];
}

class GetUserLoadingState extends AuthState {}

class GetUserSuccessState extends AuthState {
  final UserModel user;
  GetUserSuccessState(this.user);
}

class GetUserErrorState extends AuthState {
  final String message;
  GetUserErrorState(this.message);
}
