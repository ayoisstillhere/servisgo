
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_current_uid_usecase.dart';
import '../../../domain/usecases/is_signin_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSigninUsecase isSigninUsecase;
  final GetCurrentUidUsecase getCurrentUidUsecase;
  AuthCubit({
    required this.isSigninUsecase,
    required this.getCurrentUidUsecase,
  }) : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      final isSignin = await isSigninUsecase.call();
      if (isSignin == true) {
        final currentUid = await getCurrentUidUsecase.call();
        emit(Authenticated(uid: currentUid));
      } else {
        emit(Unauthenticated());
      }
    } catch (_) {
      emit(Unauthenticated());
    }
  }

  Future<void> signedIn() async {
    final currentUid = await getCurrentUidUsecase.call();
    emit(Authenticated(uid: currentUid));
  }

  Future<void> loggedOut() async {
    emit(Unauthenticated());
  }
}
