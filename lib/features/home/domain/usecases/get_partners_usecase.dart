import '../../../auth/domain/repositories/firebase_repository.dart';
import '../entities/partner_entity.dart';

class GetPartnersUsecase {
  final FirebaseRepository repository;
  GetPartnersUsecase({
    required this.repository,
  });

  Stream<List<PartnerEntity>> call() => repository.getPartners();
}
