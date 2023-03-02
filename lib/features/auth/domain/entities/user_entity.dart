import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String pfpURL;

  const UserEntity(
    this.uid,
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
    this.pfpURL,
  );

  @override
  List<Object?> get props => [
        uid,
        name,
        email,
        phoneNumber,
        address,
        pfpURL,
      ];
}
