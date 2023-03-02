import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:servisgo/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String uid,
    required String name,
    required String email,
    required String phoneNumber,
    required String address,
    required String pfpURL,
  }) : super(
          uid,
          name,
          email,
          phoneNumber,
          address,
          pfpURL,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      pfpURL: json['pfpURL'],
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
      uid: (documentSnapshot.data()! as dynamic)['uid'],
      name: (documentSnapshot.data()! as dynamic)['name'],
      email: (documentSnapshot.data()! as dynamic)['email'],
      phoneNumber: (documentSnapshot.data()! as dynamic)['phoneNumber'],
      address: (documentSnapshot.data()! as dynamic)['address'],
      pfpURL: (documentSnapshot.data()! as dynamic)['pfpURL'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "address": address,
      "pfpURL":pfpURL,
    };
  }
}
