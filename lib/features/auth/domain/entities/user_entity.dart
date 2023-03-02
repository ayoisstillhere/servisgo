import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String phoenNumber;
  final String address;

  const User(
    this.uid,
    this.name,
    this.email,
    this.phoenNumber,
    this.address,
  );

  @override
  List<Object?> get props => [
        uid,
        name,
        email,
        phoenNumber,
        address,
      ];
}
