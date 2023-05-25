import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:servisgo/features/confirmBooking/domain/entities/job_request_entity.dart';

class JobRequestModel extends JobRequestEntity {
  const JobRequestModel({
    required String id,
    required String customerId,
    required String serviceClass,
    required String jobRequestStatus,
    required String scheduledTime,
    required String scheduledDate,
    required Location location,
    required String additionalDetails,
  }) : super(
          id,
          customerId,
          serviceClass,
          jobRequestStatus,
          scheduledTime,
          scheduledDate,
          location,
          additionalDetails,
        );

  factory JobRequestModel.fromJson(Map<String, dynamic> json) {
    return JobRequestModel(
      id: json['id'],
      customerId: json['customerId'],
      serviceClass: json['serviceClass'],
      jobRequestStatus: json['jobRequestStatus'],
      scheduledTime: json['scheduledTime'],
      scheduledDate: json['scheduledDate'],
      location: json['location'],
      additionalDetails: json['additionalDetails'],
    );
  }

  factory JobRequestModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return JobRequestModel(
      id: (documentSnapshot.data()! as dynamic)['id'],
      customerId: (documentSnapshot.data()! as dynamic)['customerId'],
      serviceClass: (documentSnapshot.data()! as dynamic)['serviceClass'],
      jobRequestStatus: (documentSnapshot.data()! as dynamic)['jobRequestStatus'],
      scheduledTime: (documentSnapshot.data()! as dynamic)['scheduledTime'],
      scheduledDate: (documentSnapshot.data()! as dynamic)['scheduledDate'],
      location: (documentSnapshot.data()! as dynamic)['location'],
      additionalDetails:
          (documentSnapshot.data()! as dynamic)['additionalDetails'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "id": id,
      "customerId": customerId,
      "serviceClass": serviceClass,
      "jobRequestStatus": jobRequestStatus,
      "scheduledTime": scheduledTime,
      "scheduledDate": scheduledDate,
      "location": location,
      "additionalDetails": additionalDetails,
    };
  }
}
