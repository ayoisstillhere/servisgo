import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/create_job_request_usecase.dart';

part 'job_request_state.dart';

class JobRequestCubit extends Cubit<JobRequestState> {
  final CreateJobRequestUsecase createJobRequestUsecase;
  JobRequestCubit({
    required this.createJobRequestUsecase,
  }) : super(JobRequestInitial());

  Future<void> createJobRequest({
    required String serviceClass,
    required String scheduledTime,
    required String scheduledDate,
    required String address,
    required String city,
    required String state,
    required double? latitude,
    required double? longitude,
    required String additionalDetails,
    required String price,
  }) async {
    emit(JobRequestLoading());
    try {
      await createJobRequestUsecase.call(
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
      emit(JobRequestSuccess());
    } on SocketException catch (e) {
      emit(JobRequestFailure(e.message));
    } catch (_) {
      emit(const JobRequestFailure("Unable to Submit Job Request"));
    }
  }
}
