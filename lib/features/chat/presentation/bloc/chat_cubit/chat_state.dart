part of 'chat_cubit.dart';

abstract class ChatState extends Equatable {
  const ChatState();
}

class ChatInitial extends ChatState {
  @override
  List<Object> get props => [];
}

class ChatLoading extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatLoaded extends ChatState {
  final List<TextMessageEntity> messages;
  const ChatLoaded({
    required this.messages,
  });
  @override
  List<Object?> get props => [messages];
}
