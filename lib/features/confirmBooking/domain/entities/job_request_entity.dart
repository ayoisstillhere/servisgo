import 'package:equatable/equatable.dart';

class JobRequestEntity extends Equatable {
  final String id;
  final String customerId;
  final String serviceClass;
  final String jobRequestStatus;
  final String scheduledTime;
  final String scheduledDate;
  final String address;
  final String city;
  final String state;
  final double? latitude;
  final double? longitude;
  final String additionalDetails;
  final String price;

  const JobRequestEntity(
    this.id,
    this.customerId,
    this.serviceClass,
    this.jobRequestStatus,
    this.scheduledTime,
    this.scheduledDate,
    this.address,
    this.city,
    this.state,
    this.latitude,
    this.longitude,
    this.additionalDetails,
    this.price,
  );

  @override
  List<Object?> get props => [
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
        price,
      ];
}
