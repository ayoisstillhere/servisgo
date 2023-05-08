import 'package:servisgo/features/auth/domain/entities/user_entity.dart';
import 'package:servisgo/features/auth/domain/repositories/firebase_repository.dart';

class GetUsersUsecase {
  final FirebaseRepository repository;
  GetUsersUsecase({
    required this.repository,
  });

  Stream<List<UserEntity>> call() => repository.getUsers();
}
