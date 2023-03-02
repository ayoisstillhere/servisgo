import 'package:servisgo/features/auth/domain/repositories/firebase_repository.dart';

class GetCurrentUidUsecase {
  final FirebaseRepository repository;

  GetCurrentUidUsecase(this.repository);

  Future<String> call() async => await repository.getCurrentUid();
}
