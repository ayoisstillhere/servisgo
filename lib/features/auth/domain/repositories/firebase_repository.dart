import '../../../chat/domain/entities/text_message_entity.dart';

import '../../../tracker/domain/entities/accepted_service_entity.dart';

import '../../../home/domain/entities/partner_entity.dart';
import '../entities/user_entity.dart';

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
  Future<void> sendTextMessage(TextMessageEntity textMessage);
  Stream<List<TextMessageEntity>> getTextMessages();
}
