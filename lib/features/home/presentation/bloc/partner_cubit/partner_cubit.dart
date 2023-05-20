import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:servisgo/features/home/domain/usecases/get_partners_usecase.dart';

import '../../../domain/entities/partner_entity.dart';

part 'partner_state.dart';

class PartnerCubit extends Cubit<PartnerState> {
  final GetPartnersUsecase getPartnersUsecase;
  PartnerCubit({
    required this.getPartnersUsecase,
  }) : super(PartnerInitial());
  
   Future<void> getPartners() async {
    try {
      final partner = getPartnersUsecase.call();
      partner.listen((partners) {
        emit(PartnerLoaded(partners: partners));
      });
    } on SocketException catch (_) {}
  }
}
