import '../repositories/firebase_repository.dart';

class GoogleSigninUsecase {
  final FirebaseRepository repository;
  GoogleSigninUsecase({
    required this.repository,
  });

  Future<void> call() async => await repository.googleSignIn();
}
