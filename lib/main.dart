// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'features/auth/presentation/bloc/signin_cubit/signin_cubit.dart';
import 'features/home/presentation/pages/home_screen.dart';
import 'features/onboarding/presentation/pages/onboarding_screen.dart';
import 'injection_container.dart' as di;
import 'theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider<SigninCubit>(
          create: (_) => di.sl<SigninCubit>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ServisGo',
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darktheme,
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, authState) {
            if (authState is Authenticated) {
              return const HomeScreen();
            } else {
              return const OnboardingScreen();
            }
            // If(authState is Unauthenticated) {
            //   return const OnboardingScreen();
            // }
          },
        ),
      ),
    );
  }
}
