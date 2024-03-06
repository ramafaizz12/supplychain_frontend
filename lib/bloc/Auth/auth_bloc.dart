import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supplychain_beras/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({AuthService? auth}) : super(AuthInitial()) {
    auth = AuthService();
    on<AppStarted>((event, emit) async {
      final bool token = await auth!.hasToken();
      final String? org = await auth.getorg();
      if (token) {
        emit(AuthAuthenticated(organization: org));
      } else {
        emit(AuthUthenticated());
      }
    });
    on<Loggedin>((event, emit) async {
      await auth!.persistToken(event.token, event.organization);
      emit(AuthAuthenticated());
    });
    on<LoggedOut>((event, emit) async {
      emit(AuthLoading());
      await auth!.deleteToken();
      emit(AuthUthenticated());
    });
  }
}
