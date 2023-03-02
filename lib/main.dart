import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servisgo/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';

import 'features/onboarding/presentation/pages/onboarding_screen.dart';
import 'theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

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
          create: (_) => AuthCubit(
            isSigninUsecase: isSigninUsecase,
            getCurrentUidUsecase: getCurrentUidUsecase,
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        home: const OnboardingScreen(),
      ),
    );
  }
}
