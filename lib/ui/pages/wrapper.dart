part of 'pages.dart';

class Wrapper extends StatelessWidget {
  static const String routename = '/wrapperpage';

  const Wrapper({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthAuthenticated) {
        // return HomePage(
        //     haldata: HalamanDataAdmin(), dashboard: DashboardAdmin());
        return HomePage();
      }
      if (state is AuthUthenticated) {
        return LoginPage();
      }
      return const LoadingPage();
    });
  }
}
