import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_messages_usecase.dart';
import '../../../domain/usecases/send_text_message_usecase.dart';

import '../../../domain/entities/text_message_entity.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetMessagesUsecase getMessagesUsecase;
  final SendTextMessageUseCase sendTextMessageUseCase;
  ChatCubit({
    required this.getMessagesUsecase,
    required this.sendTextMessageUseCase,
  }) : super(ChatInitial());

  Future<void> sendTextMessage(
      {required TextMessageEntity textMessageEntity}) async {
    try {
      await sendTextMessageUseCase.call(textMessageEntity);
    } on SocketException catch (_) {}
  }

  Future<void> getTextMessages() async {
    try {
      final messages = getMessagesUsecase.call();
      messages.listen((msg) {
        emit(ChatLoaded(messages: msg));
      });
    } on SocketException catch (_) {}
  }
}
