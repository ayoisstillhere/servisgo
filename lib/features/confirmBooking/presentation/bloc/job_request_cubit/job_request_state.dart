part of 'job_request_cubit.dart';

abstract class JobRequestState extends Equatable {
  const JobRequestState();
}

class JobRequestInitial extends JobRequestState {
  @override
  List<Object> get props => [];
}

class JobRequestLoading extends JobRequestState {
  @override
  List<Object?> get props => [];
}

class JobRequestFailure extends JobRequestState {
  final String errorMessage;

  const JobRequestFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

class JobRequestSuccess extends JobRequestState {
  @override
  List<Object?> get props => [];
}
