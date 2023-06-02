import '../../../auth/domain/repositories/firebase_repository.dart';
import '../entities/text_message_entity.dart';

class SendTextMessageUseCase {
  final FirebaseRepository repository;

  SendTextMessageUseCase({required this.repository});

  Future<void> call(TextMessageEntity textMessage) async {
    return repository.sendTextMessage(textMessage);
  }
}