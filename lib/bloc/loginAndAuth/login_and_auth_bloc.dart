import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supplychain_beras/bloc/Auth/auth_bloc.dart';
import 'package:supplychain_beras/services/auth_service.dart';

part 'login_and_auth_event.dart';
part 'login_and_auth_state.dart';

class LoginAndAuthBloc extends Bloc<LoginAndAuthEvent, LoginAndAuthState> {
  AuthService? auth;
  AuthBloc? authbloc;
  LoginAndAuthBloc({AuthService? auth, AuthBloc? authbloc})
      : super(LoginAndAuthInitial()) {
    on<LoginButton>((event, emit) async {
      emit(LoginLoaded());
      try {
        final token = await auth!
            .loginapi(event.email, event.password, event.organization);
        authbloc!.add(Loggedin(
            token: "Bearer $token", organization: event.organization!));

        emit(LoginAndAuthInitial(org: event.organization));
      } catch (e) {
        emit(LoginFailure(error: e.toString()));
      }
    });
  }
}
