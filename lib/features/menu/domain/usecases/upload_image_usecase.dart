import 'dart:typed_data';

import 'package:servisgo/features/menu/domain/repositories/firebase_storage_repository.dart';

class UploadImageUsecase {
  final FirebaseStorageRepository firebaseStorageRepository;
  UploadImageUsecase({
    required this.firebaseStorageRepository,
  });

  Future<String> call(Uint8List image) async =>
      await firebaseStorageRepository.uploadImage(image);
}
