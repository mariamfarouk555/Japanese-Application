import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuko_application/Screens/homepage.dart';
import 'package:tuko_application/Screens/splash.dart';
import 'package:tuko_application/Screens/login_screen.dart';
import 'package:tuko_application/auth/auth_cubit.dart';
import 'package:tuko_application/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit()..checkLoggedInUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Splash(),
        routes: {
          "/login": (context) => const LoginScreen(),
          "/home": (context) => const HomePage(),
        },
      ),
    );
  }
}
