import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreMethods {
  final _firestore = FirebaseFirestore.instance;

  storeUserInfo({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String uid,
  }) async {
    try {
      _firestore.collection('users').doc(uid).set({
        name: name,
        email: email,
        password: password,
        phone: phone,
        uid: uid,
      });
      return 'success';
    } catch (e) {
      return e.toString();
    }
  }
}
