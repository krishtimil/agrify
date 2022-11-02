import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImageToStorage(
      {required String childName,
      required Uint8List image,
      }) async {
    Reference reference =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);
    UploadTask uploadTask = reference.putData(image);
    var snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
