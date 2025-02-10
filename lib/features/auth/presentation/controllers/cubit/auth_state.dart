part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class ChangePasswordVisibility extends AuthState {
  final bool isVisible;

  ChangePasswordVisibility(this.isVisible);

  @override
  List<Object> get props => [isVisible];
}

class AuthValidationError extends AuthState {
  final String? emailError;
  final String? passwordError;

  AuthValidationError({this.emailError, this.passwordError});

  @override
  List<Object> get props => [emailError ?? '', passwordError ?? ''];
}
