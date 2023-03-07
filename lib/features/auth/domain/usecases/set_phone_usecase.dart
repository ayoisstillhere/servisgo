import '../repositories/firebase_repository.dart';

class SetPhoneUsecase {
  final FirebaseRepository repository;
  SetPhoneUsecase({
    required this.repository,
  });

  Future<void> call(String phoneNumber) async {
    repository.setPhone(phoneNumber);
  }
}
