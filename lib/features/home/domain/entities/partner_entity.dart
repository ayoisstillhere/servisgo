import 'package:equatable/equatable.dart';

class PartnerEntity extends Equatable {
  final String partnerId;
  final String partnerName;
  final String partnerEmail;
  final String partnerPhone;
  final String status;
  final String serviceClass;
  final String partnerPfpURL;
  final List ratings;
  final int completed;

  double get averageRating {
    if (ratings.isEmpty) {
      return 0;
    }

    double sum = ratings.fold(0, (a, b) => a + b);
    return sum / ratings.length;
  }

  const PartnerEntity(
    this.partnerId,
    this.partnerName,
    this.partnerEmail,
    this.partnerPhone,
    this.status,
    this.serviceClass,
    this.partnerPfpURL,
    this.ratings,
    this.completed,
  );

  @override
  List<Object?> get props => [
        partnerId,
        partnerName,
        partnerEmail,
        partnerPhone,
        status,
        serviceClass,
        partnerPfpURL,
        ratings,
        completed,
      ];
}
