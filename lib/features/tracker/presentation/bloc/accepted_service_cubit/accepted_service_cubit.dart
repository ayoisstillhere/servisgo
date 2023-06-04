import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/domain/usecases/update_service_rating_usecase.dart';

import '../../../../home/domain/usecases/update_service_to_completed_usecase.dart';
import '../../../domain/entities/accepted_service_entity.dart';
import '../../../domain/usecases/get_accepted_requests_usecases.dart';

part 'accepted_service_state.dart';

class AcceptedServiceCubit extends Cubit<AcceptedServiceState> {
  final GetAcceptedRequestsUsecase getAcceptedRequestsUsecase;
  final UpdateServiceToCompletedUsecase updateServiceToCompletedUsecase;
  final UpdateServiceRatingUsecase updateServiceRatingUsecase;
  AcceptedServiceCubit({
    required this.getAcceptedRequestsUsecase,
    required this.updateServiceToCompletedUsecase,
    required this.updateServiceRatingUsecase,
  }) : super(AcceptedServiceInitial());

  Future<void> getAcceptedRequests() async {
    try {
      final acceptedRequest = getAcceptedRequestsUsecase.call();
      acceptedRequest.listen((acceptedRequests) {
        emit(AcceptedServiceLoaded(acceptedRequests: acceptedRequests));
      });
    } on SocketException catch (_) {}
  }

  Future<void> updateServiceToCompleted(
      String serviceId, String partnerId) async {
    try {
      await updateServiceToCompletedUsecase.call(serviceId, partnerId);
    } on SocketException catch (_) {}
  }

  Future<void> updateServiceRating(
      String serviceId, String partnerId, double rating) async {
    try {
      await updateServiceRatingUsecase.call(serviceId, partnerId, rating);
    } on SocketException catch (_) {}
  }
}
