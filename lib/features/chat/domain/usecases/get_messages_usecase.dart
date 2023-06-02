import '../../../auth/domain/repositories/firebase_repository.dart';
import '../entities/text_message_entity.dart';

class GetMessagesUsecase {
  final FirebaseRepository repository;

  GetMessagesUsecase({required this.repository});

  Stream<List<TextMessageEntity>> call()  => repository.getTextMessages();
}