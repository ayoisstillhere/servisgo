import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String pfpURL;
  final String city;
  final String state;

  const UserEntity(
    this.uid,
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
    this.pfpURL,
    this.city,
    this.state,
  );

  @override
  List<Object?> get props => [
        uid,
        name,
        email,
        phoneNumber,
        address,
        pfpURL,
        city,
        state,
      ];
}
