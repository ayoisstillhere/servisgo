import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;

  const UserEntity(
    this.uid,
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
  );

  @override
  List<Object?> get props => [
        uid,
        name,
        email,
        phoneNumber,
        address,
      ];
}
