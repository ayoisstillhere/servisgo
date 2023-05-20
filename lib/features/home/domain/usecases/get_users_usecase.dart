import '../../../auth/domain/entities/user_entity.dart';
import '../../../auth/domain/repositories/firebase_repository.dart';

class GetUsersUsecase {
  final FirebaseRepository repository;
  GetUsersUsecase({
    required this.repository,
  });

  Stream<List<UserEntity>> call() => repository.getUsers();
}
