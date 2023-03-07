import 'package:servisgo/features/auth/domain/repositories/firebase_repository.dart';

class GoogleSignupUsecase {
  final FirebaseRepository repository;
  GoogleSignupUsecase({
    required this.repository,
  });

  Future<void> call() async {
    repository.googleSignUp();
  }
}
