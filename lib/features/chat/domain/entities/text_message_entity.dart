import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TextMessageEntity extends Equatable {
  final String recipientId;
  final String senderId;
  final Timestamp timestamp;
  final String message;
  final String recipientName;
  final String senderName;

  const TextMessageEntity(
    this.recipientId,
    this.senderId,
    this.timestamp,
    this.message,
    this.recipientName,
    this.senderName,
  );

  @override
  List<Object?> get props => [
        recipientId,
        senderId,
        timestamp,
        message,
        recipientName,
        senderName,
      ];
}
