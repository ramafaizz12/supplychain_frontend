part of 'login_and_auth_bloc.dart';

@immutable
abstract class LoginAndAuthEvent {}

class LoginButton extends LoginAndAuthEvent {
  final String? email;
  final String? password;
  final String? organization;

  LoginButton(
      {required this.email,
      required this.password,
      required this.organization});
}

class EventOrganizationName extends LoginAndAuthEvent {
  final String? org;

  EventOrganizationName({this.org});
}
