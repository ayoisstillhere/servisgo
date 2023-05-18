import 'dart:typed_data';

abstract class FirebaseStorageRepository {
  Future<String> uploadImage(Uint8List image);
}
