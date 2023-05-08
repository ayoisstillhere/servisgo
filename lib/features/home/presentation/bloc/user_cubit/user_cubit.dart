import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:servisgo/features/auth/domain/entities/user_entity.dart';
import 'package:servisgo/features/home/domain/usecases/get_users_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUsersUsecase usersUsecase;
  UserCubit({
    required this.usersUsecase,
  }) : super(UserInitial());

  Future<void> getUsers() async {
    try {
      final user = usersUsecase.call();
      user.listen((users) {
        emit(UserLoaded(users: users));
      });
    } on SocketException catch (_) {}
  }
}
