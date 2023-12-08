part of 'login_and_auth_bloc.dart';

@immutable
abstract class LoginAndAuthState {}

final class LoginAndAuthInitial extends LoginAndAuthState {
  final String? org;

  LoginAndAuthInitial({this.org});
}

class LoginLoaded extends LoginAndAuthState {}

class LoginFailure extends LoginAndAuthState {
  final String? error;

  LoginFailure({this.error});
}

class OrganizationName extends LoginAndAuthState {
  final String? org;

  OrganizationName({this.org});
}
