import 'package:servisgo/features/auth/domain/repositories/firebase_repository.dart';

class UpdatePfpUrlUsecase {
  final FirebaseRepository repository;
  UpdatePfpUrlUsecase({
    required this.repository,
  });
   Future<void> call(String newPfpUrl, String uid) async => await repository.updatePfpUrl(newPfpUrl, uid);
}
