
import '../../../auth/domain/repositories/firebase_repository.dart';
import '../entities/accepted_service_entity.dart';

class GetAcceptedRequestsUsecase {
  final FirebaseRepository repository;
  GetAcceptedRequestsUsecase({
    required this.repository,
  });

  Stream<List<AcceptedServiceEntity>> call() =>
      repository.getAcceptedServices();
}
