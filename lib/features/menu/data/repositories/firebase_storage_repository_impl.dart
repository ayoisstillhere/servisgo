import 'dart:typed_data';

import '../../domain/repositories/firebase_storage_repository.dart';
import '../datasources/firebase_storage_remote_datasource.dart';

class FirebaseStorageRepositoryImpl implements FirebaseStorageRepository {
  final FirebaseStorageRemoteDatasource firebaseStorageRemoteDatasource;
  FirebaseStorageRepositoryImpl({
    required this.firebaseStorageRemoteDatasource,
  });

  @override
  Future<String> uploadImage(Uint8List image) async =>
      await firebaseStorageRemoteDatasource.uploadImage(image);
}
