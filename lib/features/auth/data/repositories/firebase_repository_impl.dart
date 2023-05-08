import 'package:servisgo/features/auth/domain/entities/user_entity.dart';

import '../../domain/repositories/firebase_repository.dart';
import '../datasources/firebase_remote_datasource.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDatasource firebaseRemoteDatasource;
  FirebaseRepositoryImpl({
    required this.firebaseRemoteDatasource,
  });

  @override
  Future<void> signUp(
    String email,
    String password,
  ) async =>
      await firebaseRemoteDatasource.signUp(
        email,
        password,
      );

  @override
  Future<String> getCurrentUid() async =>
      await firebaseRemoteDatasource.getCurrentUid();

  @override
  Future<bool> isSignIn() async => await firebaseRemoteDatasource.isSignIn();

  @override
  Future<void> signIn(
    String email,
    String password,
  ) async =>
      await firebaseRemoteDatasource.signIn(
        email,
        password,
      );

  @override
  Future<void> createCurrentUser(
    String name,
    String email,
    String phoneNumber,
    String address,
    String pfpURL,
  ) async {
    return await firebaseRemoteDatasource.createCurrentUser(
      name,
      email,
      phoneNumber,
      address,
      pfpURL,
    );
  }

  @override
  Future<void> signOut() => firebaseRemoteDatasource.signOut();

  @override
  Future<void> googleSignIn() async =>
      await firebaseRemoteDatasource.googleSignIn();

  @override
  Future<void> googleSignUp() async =>
      await firebaseRemoteDatasource.googleSignUp();

  @override
  Future<void> setPhone(String phoneNumber) async {
    return await firebaseRemoteDatasource.setPhone(phoneNumber);
  }

  @override
  Future<void> resetPassword(String email) async =>
      await firebaseRemoteDatasource.resetPassword(email);

  @override
  Stream<List<UserEntity>> getUsers() {
    return firebaseRemoteDatasource.getUsers();
  }
}
