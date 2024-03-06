part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class Loggedin extends AuthEvent {
  final String token;
  final String organization;

  Loggedin({required this.token, required this.organization});
}

class LoggedOut extends AuthEvent {}
