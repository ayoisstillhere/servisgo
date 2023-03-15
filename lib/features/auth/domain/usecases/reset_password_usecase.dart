import '../repositories/firebase_repository.dart';

class ResetPasswordUsecase {
  final FirebaseRepository repository;
  ResetPasswordUsecase({
    required this.repository,
  });

  Future<void> call(String email) async =>
      await repository.resetPassword(email);
}
