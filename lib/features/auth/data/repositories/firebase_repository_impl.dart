import '../../../chat/domain/entities/text_message_entity.dart';

import '../../../home/domain/entities/partner_entity.dart';
import '../../../tracker/domain/entities/accepted_service_entity.dart';

import '../../domain/entities/user_entity.dart';

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

  @override
  Future<void> updateAddress(String newAddress, String newCity, String newState,
          String uid) async =>
      await firebaseRemoteDatasource.updateAddress(
          newAddress, newCity, newState, uid);

  @override
  Future<void> updateName(String newName, String uid) async =>
      await firebaseRemoteDatasource.updateName(newName, uid);

  @override
  Future<void> updatePhone(String newPhoneNo, String uid) async =>
      await firebaseRemoteDatasource.updatePhone(newPhoneNo, uid);

  @override
  Future<void> updatePfpUrl(String newPfpUrl, String uid) async =>
      await firebaseRemoteDatasource.updatePfpUrl(newPfpUrl, uid);

  @override
  Stream<List<PartnerEntity>> getPartners() {
    return firebaseRemoteDatasource.getPartners();
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
  ) async =>
      await firebaseRemoteDatasource.createJobRequest(
        serviceClass,
        scheduledTime,
        scheduledDate,
        address,
        city,
        state,
        latitude,
        longitude,
        additionalDetails,
        price,
      );

  @override
  Stream<List<AcceptedServiceEntity>> getAcceptedServices() {
    return firebaseRemoteDatasource.getAcceptedServices();
  }

  @override
  Future<void> updateServiceToCompleted(
          String serviceId, String partnerId) async =>
      await firebaseRemoteDatasource.updateServiceToCompleted(
          serviceId, partnerId);

  @override
  Future<void> updateServiceRating(
          String serviceId, String partnerId, double rating) async =>
      await firebaseRemoteDatasource.updateServiceRating(
          serviceId, partnerId, rating);

  @override
  Stream<List<TextMessageEntity>> getTextMessages() {
    return firebaseRemoteDatasource.getTextMessages();
  }

  @override
  Future<void> sendTextMessage(TextMessageEntity textMessage) {
    return firebaseRemoteDatasource.sendTextMessage(textMessage);
  }
}
