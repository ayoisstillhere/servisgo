import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/job_request_entity.dart';

class JobRequestModel extends JobRequestEntity {
  const JobRequestModel({
    required String id,
    required String customerId,
    required String serviceClass,
    required String jobRequestStatus,
    required String scheduledTime,
    required String scheduledDate,
    required String address,
    required String city,
    required String state,
    required double? latitude,
    required double? longitude,
    required String additionalDetails,
    required String price,
  }) : super(
            id,
            customerId,
            serviceClass,
            jobRequestStatus,
            scheduledTime,
            scheduledDate,
            address,
            city,
            state,
            latitude,
            longitude,
            additionalDetails,
            price);

  factory JobRequestModel.fromJson(Map<String, dynamic> json) {
    return JobRequestModel(
      id: json['id'],
      customerId: json['customerId'],
      serviceClass: json['serviceClass'],
      jobRequestStatus: json['jobRequestStatus'],
      scheduledTime: json['scheduledTime'],
      scheduledDate: json['scheduledDate'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      additionalDetails: json['additionalDetails'],
      price: json['price'],
    );
  }

  factory JobRequestModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return JobRequestModel(
      id: (documentSnapshot.data()! as dynamic)['id'],
      customerId: (documentSnapshot.data()! as dynamic)['customerId'],
      serviceClass: (documentSnapshot.data()! as dynamic)['serviceClass'],
      jobRequestStatus:
          (documentSnapshot.data()! as dynamic)['jobRequestStatus'],
      scheduledTime: (documentSnapshot.data()! as dynamic)['scheduledTime'],
      scheduledDate: (documentSnapshot.data()! as dynamic)['scheduledDate'],
      address: (documentSnapshot.data()! as dynamic)['address'],
      city: (documentSnapshot.data()! as dynamic)['city'],
      state: (documentSnapshot.data()! as dynamic)['state'],
      latitude: (documentSnapshot.data()! as dynamic)['latitude'],
      longitude: (documentSnapshot.data()! as dynamic)['longitude'],
      additionalDetails:
          (documentSnapshot.data()! as dynamic)['additionalDetails'],
      price:
          (documentSnapshot.data()! as dynamic)['price'],
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
      "address": address,
      "city": city,
      "state": state,
      "latitude": latitude,
      "longitude": longitude,
      "additionalDetails": additionalDetails,
      "price": price,
    };
  }
}
