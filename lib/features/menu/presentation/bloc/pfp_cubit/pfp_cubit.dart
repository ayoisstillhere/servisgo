import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:servisgo/features/menu/domain/usecases/update_pfp_url_usecase.dart';
import 'package:servisgo/features/menu/domain/usecases/upload_image_usecase.dart';

part 'pfp_state.dart';

class PfpCubit extends Cubit<PfpState> {
  final UploadImageUsecase uploadImageUsecase;
  final UpdatePfpUrlUsecase updatePfpUrlUsecase;
  PfpCubit({
    required this.uploadImageUsecase,
    required this.updatePfpUrlUsecase,
  }) : super(PfpInitial());

  Future<String> uploadImage(Uint8List image) async {
    return await uploadImageUsecase.call(image);
  }

  Future<void> updatePFPUrl(String newPfpUrl, String uid) async {
    return await updatePfpUrlUsecase.call(newPfpUrl, uid);
  }
}
