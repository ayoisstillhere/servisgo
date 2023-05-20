import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/domain/entities/user_entity.dart';
import '../../../domain/usecases/get_users_usecase.dart';
import '../../../../menu/domain/usecases/update_address_usecase.dart';
import '../../../../menu/domain/usecases/update_name_usecase.dart';
import '../../../../menu/domain/usecases/update_phone_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUsersUsecase usersUsecase;
  final UpdateAddressUsecase updateAddressUsecase;
  final UpdateNameUsecase updateNameUsecase;
  final UpdatePhoneUsecase updatePhoneUsecase;
  UserCubit({
    required this.usersUsecase,
    required this.updateAddressUsecase,
    required this.updateNameUsecase,
    required this.updatePhoneUsecase,
  }) : super(UserInitial());

  Future<void> getUsers() async {
    try {
      final user = usersUsecase.call();
      user.listen((users) {
        emit(UserLoaded(users: users));
      });
    } on SocketException catch (_) {}
  }

  Future<void> updateAddress(String address, String uid) async {
    try {
      await updateAddressUsecase.call(address, uid);
    } on SocketException catch (_) {}
  }

  Future<void> updateName(String name, String uid) async {
    try {
      await updateNameUsecase.call(name, uid);
    } on SocketException catch (_) {}
  }

  Future<void> updatePhone(String phone, String uid) async {
    try {
      await updatePhoneUsecase.call(phone, uid);
    } on SocketException catch (_) {}
  }
}
