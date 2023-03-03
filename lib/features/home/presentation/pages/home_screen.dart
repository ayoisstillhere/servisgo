import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servisgo/components/default_button.dart';
import 'package:servisgo/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:servisgo/features/auth/presentation/bloc/signin_cubit/signin_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DefaultButton(
          text: "Sign Out",
          press: () {
            BlocProvider.of<AuthCubit>(context).loggedOut();
            BlocProvider.of<SigninCubit>(context).submitSignOut();
          },
        ),
      ),
    );
  }
}
