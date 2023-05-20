import '../../../auth/domain/repositories/firebase_repository.dart';

class UpdatePhoneUsecase {
  final FirebaseRepository repository;
  UpdatePhoneUsecase({
    required this.repository,
  });

  Future<void> call(
    String newPhoneNo,
    String uid,
  ) async =>
      await repository.updatePhone(
        newPhoneNo,
        uid,
      );
}
