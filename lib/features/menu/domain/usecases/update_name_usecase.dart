import 'package:servisgo/features/auth/domain/repositories/firebase_repository.dart';

class UpdateNameUsecase {
  final FirebaseRepository repository;

  UpdateNameUsecase({required this.repository});

  Future<void> call(
    String newName,
    String uid,
  ) async =>
      await repository.updateName(
        newName,
        uid,
      );
}
