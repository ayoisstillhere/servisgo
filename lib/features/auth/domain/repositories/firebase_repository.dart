import 'package:servisgo/features/auth/domain/entities/user_entity.dart';

abstract class FirebaseRepository {
  Future<void> signUp(String email, String password);
  Future<void> signIn(String email, String password);
  Future<bool> isSignIn();
  Future<String> getCurrentUid();
  Future<void> createCurrentUser(
    String name,
    String email,
    String phoneNumber,
    String address,
    String pfpURL,
  );
  Future<void> signOut();
  Future<void> googleSignIn();
  Future<void> googleSignUp();
  Future<void> setPhone(String phoneNumber);
  Future<void> resetPassword(String email);
  Stream<List<UserEntity>> getUsers();
  Future<void> updateName(String newName, String uid);
  Future<void> updatePhone(String newPhoneNo, String uid);
  Future<void> updateAddress(String newAddress, String uid);
}
