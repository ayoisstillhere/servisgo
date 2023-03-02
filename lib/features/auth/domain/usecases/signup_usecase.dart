import 'package:servisgo/features/auth/domain/repositories/firebase_repository.dart';

class SignUpUsecase {
  final FirebaseRepository repository;

  SignUpUsecase(this.repository);

  Future<void> call(String email, String password) async {
    return repository.signUp(email, password);
  }
}
