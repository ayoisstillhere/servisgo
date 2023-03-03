import '../repositories/firebase_repository.dart';

class CreateCurrentUserUsecase {
  final FirebaseRepository repository;

  CreateCurrentUserUsecase({required this.repository});

  Future<void> call(
    String name,
    String email,
    String phoneNumber,
    String address,
    String pfpURL,
  ) async {
    repository.createCurrentUser(
      name,
      email,
      phoneNumber,
      address,
      pfpURL,
    );
  }
}
