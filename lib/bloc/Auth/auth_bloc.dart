import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supplychain_beras/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({AuthService? auth}) : super(AuthInitial()) {
    auth = AuthService();
    on<AuthEvent>((event, emit) async {
      if (event is AppStarted) {
        final bool token = await auth!.hasToken();

        if (token) {
          emit(AuthAuthenticated());
        } else {
          emit(AuthUthenticated());
        }
      }
      if (event is Loggedin) {
        await auth!.persistToken(event.token);
        emit(AuthAuthenticated());
      }
      if (event is LoggedOut) {
        emit(AuthLoading());
        await auth!.deleteToken();
        emit(AuthUthenticated());
      }
    });
  }
}
