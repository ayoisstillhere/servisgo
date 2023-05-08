import '../repositories/firebase_repository.dart';

class GoogleSignupUsecase {
  final FirebaseRepository repository;
  GoogleSignupUsecase({
    required this.repository,
  });

  Future<void> call() async => await repository.googleSignUp();
}
