import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:servisgo/features/confirmBooking/domain/entities/job_request_entity.dart';

class JobRequestModel extends JobRequestEntity {
  const JobRequestModel({
    required String id,
    required String customerId,
    required String partnerId,
    required String serviceClass,
    required String jobStatus,
    required String scheduledTime,
    required String scheduledDate,
    required Location location,
    required String additionalDetails,
  }) : super(
          id,
          customerId,
          partnerId,
          serviceClass,
          jobStatus,
          scheduledTime,
          scheduledDate,
          location,
          additionalDetails,
        );

  factory JobRequestModel.fromJson(Map<String, dynamic> json) {
    return JobRequestModel(
      id: json['id'],
      customerId: json['customerId'],
      partnerId: json['partnerId'],
      serviceClass: json['serviceClass'],
      jobStatus: json['jobStatus'],
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
      partnerId: (documentSnapshot.data()! as dynamic)['partnerId'],
      serviceClass: (documentSnapshot.data()! as dynamic)['serviceClass'],
      jobStatus: (documentSnapshot.data()! as dynamic)['jobStatus'],
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
      "partnerId": partnerId,
      "serviceClass": serviceClass,
      "jobStatus": jobStatus,
      "scheduledTime": scheduledTime,
      "scheduledDate": scheduledDate,
      "location": location,
      "additionalDetails": additionalDetails,
    };
  }
}
