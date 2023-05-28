part of 'accepted_service_cubit.dart';

abstract class AcceptedServiceState extends Equatable {
  const AcceptedServiceState();
}

class AcceptedServiceInitial extends AcceptedServiceState {
  @override
  List<Object> get props => [];
}

class AcceptedServiceLoading extends AcceptedServiceState {
  @override
  List<Object?> get props => [];
}

class AcceptedServiceFailure extends AcceptedServiceState {
  final String errorMessage;

  const AcceptedServiceFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

class AcceptedServiceSuccess extends AcceptedServiceState {
  @override
  List<Object?> get props => [];
}

class AcceptedServiceLoaded extends AcceptedServiceState {
  final List<AcceptedServiceEntity> acceptedRequests;
  const AcceptedServiceLoaded({
    required this.acceptedRequests,
  });
  @override
  List<Object?> get props => [acceptedRequests];
}
