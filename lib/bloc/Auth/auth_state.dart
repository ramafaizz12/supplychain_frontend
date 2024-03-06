part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String? organization;

  AuthAuthenticated({this.organization});
}

class AuthUthenticated extends AuthState {}

class AuthLoading extends AuthState {}
