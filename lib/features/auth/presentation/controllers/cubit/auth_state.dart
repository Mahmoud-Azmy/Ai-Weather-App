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
