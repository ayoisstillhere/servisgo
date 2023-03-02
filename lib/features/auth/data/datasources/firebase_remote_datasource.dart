abstract class FirebaseRemoteDatasource {
  Future<void> signUp(String email, String password);
  Future<void> signIn(String email, String password);
  Future<bool> isSignIn();
  Future<String> getCurrentUid();
  Future<void> createCurrentUser(
    String uid,
    String name,
    String email,
    String phoneNumber,
    String address,
  );
}
