part of 'signin_cubit.dart';

abstract class SigninState extends Equatable {
  const SigninState();
}

class SigninInitial extends SigninState {
  @override
  List<Object?> get props => [];
}

class SigninLoading extends SigninState {
  @override
  List<Object?> get props => [];
}

class SigninFailure extends SigninState {
  final String errorMessage;

  const SigninFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

class SigninSuccess extends SigninState {
  @override
  List<Object?> get props => [];
}
