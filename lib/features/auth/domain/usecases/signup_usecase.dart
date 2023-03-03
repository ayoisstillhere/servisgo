import '../repositories/firebase_repository.dart';

class SignupUsecase {
  final FirebaseRepository repository;

  SignupUsecase({required this.repository});

  Future<void> call(String email, String password) async {
    return repository.signUp(email, password);
  }
}
