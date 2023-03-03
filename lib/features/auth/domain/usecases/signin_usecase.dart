import '../repositories/firebase_repository.dart';

class SigninUsecase {
  final FirebaseRepository repository;

  SigninUsecase({required this.repository});

  Future<void> call(String email, String password) {
    return repository.signIn(email, password);
  }
}
