import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../confirmBooking/data/models/job_request_model.dart';
import 'package:uuid/uuid.dart';

import '../../../home/data/models/partner_model.dart';
import '../../../home/domain/entities/partner_entity.dart';
import '../../../tracker/data/models/accepted_service_model.dart';
import '../../../tracker/domain/entities/accepted_service_entity.dart';
import '../../domain/entities/user_entity.dart';
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
  Future<void> resetPassword(String email);
  Stream<List<UserEntity>> getUsers();
  Future<void> updateName(String newName, String uid);
  Future<void> updatePhone(String newPhoneNo, String uid);
  Future<void> updateAddress(
      String newAddress, String newCity, String newState, String uid);
  Future<void> updatePfpUrl(String newPfpUrl, String uid);
  Stream<List<PartnerEntity>> getPartners();
  Future<void> createJobRequest(
    String serviceClass,
    String scheduledTime,
    String scheduledDate,
    String address,
    String city,
    String state,
    double? latitude,
    double? longitude,
    String additionalDetails,
    String price,
  );
  Stream<List<AcceptedServiceEntity>> getAcceptedServices();
  Future<void> updateServiceToCompleted(String serviceId, String partnerId);
  Future<void> updateServiceRating(
      String serviceId, String partnerId, double rating);
}

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _userCollection = FirebaseFirestore.instance.collection("users");
  final _partnerCollection = FirebaseFirestore.instance.collection('partners');
  final _jobRequestCollection =
      FirebaseFirestore.instance.collection('jobRequests');
  final _acceptedServiceCollection =
      FirebaseFirestore.instance.collection("acceptedServices");
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
          city: '',
          state: '',
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
      await googleSignin.disconnect();
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
          address: "No address",
          pfpURL: _user!.photoUrl!,
          city: '',
          state: '',
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

  @override
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Stream<List<UserEntity>> getUsers() {
    return _userCollection.snapshots().map((querySnapshot) => querySnapshot.docs
        .map((docSnapshot) => UserModel.fromSnapshot(docSnapshot))
        .toList());
  }

  @override
  Future<void> updateAddress(
      String newAddress, String newCity, String newState, String uid) async {
    await _userCollection.doc(uid).update({
      'address': newAddress,
      'city': newCity,
      'state': newState,
    });
  }

  @override
  Future<void> updateName(String newName, String uid) async {
    await _userCollection.doc(uid).update({
      'name': newName,
    });
  }

  @override
  Future<void> updatePhone(String newPhoneNo, String uid) async {
    await _userCollection.doc(uid).update({
      'phoneNumber': newPhoneNo,
    });
  }

  @override
  Future<void> updatePfpUrl(String newPfpUrl, String uid) async {
    await _userCollection.doc(uid).update({
      'pfpURL': newPfpUrl,
    });
  }

  @override
  Stream<List<PartnerEntity>> getPartners() {
    return _partnerCollection.snapshots().map((querySnapshot) => querySnapshot
        .docs
        .map((docSnapshot) => PartnerModel.fromSnapshot(docSnapshot))
        .toList());
  }

  @override
  Future<void> createJobRequest(
    String serviceClass,
    String scheduledTime,
    String scheduledDate,
    String address,
    String city,
    String state,
    double? latitude,
    double? longitude,
    String additionalDetails,
    String price,
  ) async {
    var uuid = const Uuid();
    final String id = uuid.v4();

    final newJobRequest = JobRequestModel(
      id: id,
      customerId: _auth.currentUser!.uid,
      serviceClass: serviceClass,
      jobRequestStatus: "Pending",
      scheduledTime: scheduledTime,
      scheduledDate: scheduledDate,
      address: address,
      city: city,
      state: state,
      latitude: latitude,
      longitude: longitude,
      additionalDetails: additionalDetails,
      price: price,
    );
    await _jobRequestCollection.doc(id).set(newJobRequest.toDocument());
  }

  @override
  Stream<List<AcceptedServiceEntity>> getAcceptedServices() {
    return _acceptedServiceCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs
            .map(
                (docSnapshot) => AcceptedServiceModel.fromSnapshot(docSnapshot))
            .toList());
  }

  @override
  Future<void> updateServiceToCompleted(
      String serviceId, String partnerId) async {
    await _acceptedServiceCollection.doc(serviceId).update({
      'serviceStatus': 'Completed',
    });
    DocumentSnapshot snapshot = await _partnerCollection.doc(partnerId).get();
    if (snapshot.exists) {
      int currentValue = (snapshot.data()! as dynamic)['completed']!;
      int newValue = currentValue + 1;
      _partnerCollection.doc(partnerId).update({
        'completed': newValue,
      });
    }
  }

  @override
  Future<void> updateServiceRating(
      String serviceId, String partnerId, double rating) async {
    await _acceptedServiceCollection.doc(serviceId).update({
      'serviceRating': rating,
    });
    await _partnerCollection.doc(partnerId).update({
      'ratings': FieldValue.arrayUnion([rating]),
    });
  }
}
