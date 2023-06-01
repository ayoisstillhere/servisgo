import 'package:servisgo/features/auth/domain/repositories/firebase_repository.dart';

class UpdateServiceToCompletedUsecase {
  final FirebaseRepository repository;
  UpdateServiceToCompletedUsecase({
    required this.repository,
  });

  Future<void> call(String serviceId, String partnerId) async {
    return await repository.updateServiceToCompleted(serviceId, partnerId);
  }
}
