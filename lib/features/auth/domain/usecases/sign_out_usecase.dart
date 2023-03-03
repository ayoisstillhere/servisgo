import 'package:servisgo/features/auth/domain/repositories/firebase_repository.dart';

class SignoutUsecase {
  final FirebaseRepository repository;
  SignoutUsecase({
    required this.repository,
  });

  Future<void> call() async {
    return await repository.signOut();
  }
}
