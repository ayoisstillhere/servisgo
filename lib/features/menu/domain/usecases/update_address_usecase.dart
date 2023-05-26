import '../../../auth/domain/repositories/firebase_repository.dart';

class UpdateAddressUsecase {
  final FirebaseRepository repository;
  UpdateAddressUsecase({
    required this.repository,
  });

  Future<void> call(
    String newAddress,
    String newCity,
    String newState,
    String uid,
  ) async =>
      await repository.updateAddress(
        newAddress,
        newCity,
        newState,
        uid,
      );
}
