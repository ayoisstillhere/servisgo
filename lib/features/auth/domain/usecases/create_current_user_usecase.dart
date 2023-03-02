import 'package:servisgo/features/auth/domain/repositories/firebase_repository.dart';

class CreateCurrentUserUsecase {
  final FirebaseRepository repository;

  CreateCurrentUserUsecase({required this.repository});

  Future<void> call(
    String uid,
    String name,
    String email,
    String phoneNumber,
    String address,
    String pfpURL,
  ) async {
    repository.createCurrentUser(
      uid,
      name,
      email,
      phoneNumber,
      address,
      pfpURL,
    );
  }
}
