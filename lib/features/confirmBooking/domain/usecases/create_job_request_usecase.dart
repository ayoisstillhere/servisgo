import '../../../auth/domain/repositories/firebase_repository.dart';

class CreateJobRequestUsecase {
  final FirebaseRepository repository;
  CreateJobRequestUsecase({
    required this.repository,
  });

  Future<void> call(
    String serviceClass,
    String scheduledTime,
    String scheduledDate,
    String address,
    String city,
    String state,
    double? latitude,
    double? longitude,
    String additionalDetails,
    String price,
  ) async =>
      repository.createJobRequest(
        serviceClass,
        scheduledTime,
        scheduledDate,
        address,
        city,
        state,
        latitude,
        longitude,
        additionalDetails,
        price,
      );
}
