import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supplychain_beras/bloc/loginAndAuth/login_and_auth_bloc.dart';
import 'package:supplychain_beras/bloc/supplychain/supplychain_bloc.dart';
import 'package:supplychain_beras/firebase_options.dart';
import 'package:supplychain_beras/services/auth_service.dart';
import 'package:supplychain_beras/ui/pages/pages.dart';

import 'bloc/Auth/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthService auth = AuthService();
  final AuthBloc authbloc = AuthBloc();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(auth: auth)..add(AppStarted()),
        ),
        BlocProvider<SupplychainBloc>(create: (context) => SupplychainBloc()),
        BlocProvider<LoginAndAuthBloc>(
            create: (context) =>
                LoginAndAuthBloc(auth: auth, authbloc: authbloc)),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: Splashscreen()),
    );
  }
}
