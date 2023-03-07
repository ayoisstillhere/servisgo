import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:servisgo/features/auth/domain/usecases/google_signin_usecase.dart';
import 'package:servisgo/features/auth/domain/usecases/google_signup_usecase.dart';
import 'package:servisgo/features/auth/domain/usecases/sign_out_usecase.dart';

import '../../../domain/usecases/create_current_user_usecase.dart';
import '../../../domain/usecases/signin_usecase.dart';
import '../../../domain/usecases/signup_usecase.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final SignupUsecase signupUsecase;
  final SigninUsecase signinUsecase;
  final CreateCurrentUserUsecase createCurrentUserUsecase;
  final SignoutUsecase signoutUsecase;
  final GoogleSigninUsecase googleSigninUsecase;
  final GoogleSignupUsecase googleSignupUsecase;
  SigninCubit({
    required this.signupUsecase,
    required this.signinUsecase,
    required this.createCurrentUserUsecase,
    required this.signoutUsecase,
    required this.googleSigninUsecase,
    required this.googleSignupUsecase,
  }) : super(SigninInitial());

  Future<void> submitSignin({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    try {
      await signinUsecase.call(email, password);
      emit(SigninSuccess());
    } on SocketException catch (e) {
      emit(SigninFailure(e.message));
    } catch (_) {
      emit(const SigninFailure("Firebase Exception"));
    }
  }

  Future<void> submitRegisteration({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required String address,
    required String pfpURL,
  }) async {
    emit(SigninLoading());
    try {
      await signupUsecase.call(email, password);
      await createCurrentUserUsecase.call(
        name,
        email,
        phoneNumber,
        address,
        pfpURL,
      );
      emit(SigninSuccess());
    } on SocketException catch (e) {
      emit(SigninFailure(e.message));
    } catch (_) {
      emit(const SigninFailure("Firebase Exception"));
    }
  }

  Future<void> submitSignOut() async {
    try {
      await signoutUsecase.call();
    } on SocketException catch (_) {}
  }

  Future<void> googleSignIn() async {
    try {
      await googleSigninUsecase.call();
      emit(SigninSuccess());
    } on SocketException catch (e) {
      emit(SigninFailure(e.message));
    } catch (_) {
      emit(const SigninFailure("Firebase Exception"));
    }
  }

  Future<void> googleSignUp() async {
    try {
      await googleSignupUsecase.call();
      emit(SigninSuccess());
    } on SocketException catch (e) {
      emit(SigninFailure(e.message));
    } catch (_) {
      emit(const SigninFailure("Firebase Exception"));
    }
  }
}
