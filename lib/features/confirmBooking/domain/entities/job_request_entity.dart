import 'package:equatable/equatable.dart';

class JobRequestEntity extends Equatable {
  final String id;
  final String customerId;
  final String partnerId;
  final String serviceClass;
  final String jobStatus;
  final String scheduledTime;
  final String scheduledDate;
  final Location location;
  final String additionalDetails;

  const JobRequestEntity(
    this.id,
    this.customerId,
    this.partnerId,
    this.serviceClass,
    this.jobStatus,
    this.scheduledTime,
    this.scheduledDate,
    this.location,
    this.additionalDetails,
  );

  @override
  List<Object?> get props => [
        id,
        customerId,
        partnerId,
        serviceClass,
        jobStatus,
        scheduledTime,
        scheduledDate,
        location,
        additionalDetails,
      ];
}

class Location {
  final String address;
  final String city;
  final String state;
  final double latitude;
  final double longitude;

  const Location({
    required this.address,
    required this.city,
    required this.state,
    required this.latitude,
    required this.longitude,
  });
}
