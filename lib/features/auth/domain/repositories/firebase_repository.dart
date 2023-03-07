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
}
