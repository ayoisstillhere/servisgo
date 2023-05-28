import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:servisgo/features/tracker/domain/entities/accepted_service_entity.dart';
import 'package:servisgo/features/tracker/domain/usecases/get_accepted_requests_usecases.dart';

part 'accepted_service_state.dart';

class AcceptedServiceCubit extends Cubit<AcceptedServiceState> {
  final GetAcceptedRequestsUsecase getAcceptedRequestsUsecase;
  AcceptedServiceCubit({
    required this.getAcceptedRequestsUsecase,
  }) : super(AcceptedServiceInitial());

  Future<void> getAcceptedRequests() async {
    try {
      final acceptedRequest = getAcceptedRequestsUsecase.call();
      acceptedRequest.listen((acceptedRequests) {
        emit(AcceptedServiceLoaded(acceptedRequests: acceptedRequests));
      });
    } on SocketException catch (_) {}
  }
}
