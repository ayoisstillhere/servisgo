import 'package:servisgo/features/auth/domain/repositories/firebase_repository.dart';

class IsSigninUsecase {
  final FirebaseRepository repository;

  IsSigninUsecase(this.repository);

  Future<bool> call() async => await repository.isSignIn();
}
