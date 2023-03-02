import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:servisgo/features/auth/domain/usecases/create_current_user_usecase.dart';
import 'package:servisgo/features/auth/domain/usecases/signin_usecase.dart';
import 'package:servisgo/features/auth/domain/usecases/signup_usecase.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final SignupUsecase signupUsecase;
  final SigninUsecase signinUsecase;
  final CreateCurrentUserUsecase createCurrentUserUsecase;
  SigninCubit(
    this.signupUsecase,
    this.signinUsecase,
    this.createCurrentUserUsecase,
  ) : super(SigninInitial());

  Future<void> submitSignin({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    try {
      signinUsecase.call(email, password);
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
  }) async {
    emit(SigninLoading());
    try {
      signupUsecase.call(email, password);
      emit(SigninSuccess());
    } on SocketException catch (e) {
      emit(SigninFailure(e.message));
    } catch (_) {
      emit(const SigninFailure("Firebase Exception"));
    }
  }
}
