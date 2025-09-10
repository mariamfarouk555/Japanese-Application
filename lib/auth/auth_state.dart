part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final Map<String, dynamic>? userData;

  AuthAuthenticated(this.userData);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class AuthLoggedOut extends AuthState {}
