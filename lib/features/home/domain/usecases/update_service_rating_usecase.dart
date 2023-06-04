import '../../../auth/domain/repositories/firebase_repository.dart';

class UpdateServiceRatingUsecase {
  final FirebaseRepository repository;
  UpdateServiceRatingUsecase({
    required this.repository,
  });

  Future<void> call(String serviceId, String partnerId, double rating) async {
    return await repository.updateServiceRating(serviceId, partnerId, rating);
  }
}
