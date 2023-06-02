import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:servisgo/features/chat/domain/entities/text_message_entity.dart';

class TextMessageModel extends TextMessageEntity {
  const TextMessageModel({
    required String recipientId,
    required String senderId,
    required Timestamp timestamp,
    required String message,
    required String recipientName,
    required String senderName,
  }) : super(
          recipientId,
          senderId,
          timestamp,
          message,
          recipientName,
          senderName,
        );

  factory TextMessageModel.fromJson(Map<String, dynamic> json) {
    return TextMessageModel(
      recipientId: json['recipientId'],
      senderId: json['senderId'],
      timestamp: json['timestamp'],
      message: json['message'],
      recipientName: json['recipientName'],
      senderName: json['senderName'],
    );
  }

  factory TextMessageModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return TextMessageModel(
      recipientId: (documentSnapshot.data()! as dynamic)['recipientId'],
      senderId: (documentSnapshot.data()! as dynamic)['senderId'],
      timestamp: (documentSnapshot.data()! as dynamic)['timestamp'],
      message: (documentSnapshot.data()! as dynamic)['message'],
      recipientName: (documentSnapshot.data()! as dynamic)['recipientName'],
      senderName: (documentSnapshot.data()! as dynamic)['senderName'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "recipientId": recipientId,
      "senderId": senderId,
      "recipientName": recipientName,
      "senderName": senderName,
      "message": message,
      "timestamp": timestamp,
    };
  }
}
