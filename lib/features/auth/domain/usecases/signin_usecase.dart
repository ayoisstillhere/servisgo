import 'package:servisgo/features/auth/domain/repositories/firebase_repository.dart';

class SigninUsecase {
  final FirebaseRepository repository;

  SigninUsecase(this.repository);

  Future<void> call(String email, String password) {
    return repository.signIn(email, password);
  }
}
