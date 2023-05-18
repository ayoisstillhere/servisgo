import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class FirebaseStorageRemoteDatasource {
  Future<String> uploadImage(Uint8List image);
}

class FirebaseStorageRemoteDataSourceImpl
    implements FirebaseStorageRemoteDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Future<String> uploadImage(Uint8List image) async {
    Reference ref = _storage.ref().child("pfp").child(_auth.currentUser!.uid);

    UploadTask uploadTask = ref.putData(image);

    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
