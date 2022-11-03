import 'package:agrify/logic/controllers/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirestoreMethods {
  final _firestore = FirebaseFirestore.instance;
  final _storageMethods = StorageMethods();

  storeUserInfo({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String uid,
  }) async {
    try {
      _firestore.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'uid': uid,
      });
      return 'success';
    } catch (e) {
      return e.toString();
    }
  }

  uploadImageUrl({required String childName, required Uint8List image}) async {
    await _storageMethods.uploadImageToStorage(
        childName: childName, image: image);
  }

  nameOfUser(String uid) async {
    DocumentReference ref = _firestore.collection('users').doc(uid);
    DocumentSnapshot snap = await ref.get();
    print(snap.get('name'));
  }
}
