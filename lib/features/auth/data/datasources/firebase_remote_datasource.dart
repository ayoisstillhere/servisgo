import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';

abstract class FirebaseRemoteDatasource {
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

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _userCollection = FirebaseFirestore.instance.collection("users");
  final googleSignin = GoogleSignIn(scopes: ['email']);

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  @override
  Future<void> createCurrentUser(
    String name,
    String email,
    String phoneNumber,
    String address,
    String pfpURL,
  ) async {
    _userCollection.doc(_auth.currentUser!.uid).get().then((user) {
      if (!user.exists) {
        final newUser = UserModel(
          uid: _auth.currentUser!.uid,
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          address: address,
          pfpURL: pfpURL,
        ).toDocument();
        _userCollection.doc(_auth.currentUser!.uid).set(newUser);
        return;
      }
    });
  }

  @override
  Future<String> getCurrentUid() async => _auth.currentUser!.uid;

  @override
  // ignore: unnecessary_null_comparison
  Future<bool> isSignIn() async => _auth.currentUser!.uid != null;

  @override
  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() async {
    if (await googleSignin.isSignedIn()) {
      googleSignin.disconnect();
    }
    await _auth.signOut();
  }

  @override
  Future<void> googleSignIn() async {
    final googleUser = await googleSignin.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);
  }

  @override
  Future<void> googleSignUp() async {
    final googleUser = await googleSignin.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);

    await _userCollection.doc(_auth.currentUser!.uid).get().then((user) {
      if (!user.exists) {
        final newUser = UserModel(
          uid: _auth.currentUser!.uid,
          name: _user!.displayName!,
          email: _user!.email,
          phoneNumber: "",
          address: "",
          pfpURL: _user!.photoUrl!,
        ).toDocument();
        _userCollection.doc(_auth.currentUser!.uid).set(newUser);
        return;
      }
    });
  }

  @override
  Future<void> setPhone(String phoneNumber) async {
    await _userCollection
        .doc(_auth.currentUser!.uid)
        .update({'phoneNumber': phoneNumber});
  }
}
