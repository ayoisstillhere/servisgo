import '../repositories/firebase_repository.dart';

class IsSigninUsecase {
  final FirebaseRepository repository;

  IsSigninUsecase({required this.repository});

  Future<bool> call() async => await repository.isSignIn();
}
