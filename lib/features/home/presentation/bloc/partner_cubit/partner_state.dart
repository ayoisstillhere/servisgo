part of 'partner_cubit.dart';

abstract class PartnerState extends Equatable {
  const PartnerState();
}

class PartnerInitial extends PartnerState {
  @override
  List<Object> get props => [];
}

class PartnerLoaded extends PartnerState {
  final List<PartnerEntity> partners;
  const PartnerLoaded({
    required this.partners,
  });
  @override
  List<Object> get props => [partners];
}

class PartnerLoading extends PartnerState {
  @override
  List<Object> get props => throw UnimplementedError();
}
