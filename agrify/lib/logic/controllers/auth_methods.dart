import 'package:agrify/logic/controllers/firestore_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final _auth = FirebaseAuth.instance;
  final _firestoreMethods = FirestoreMethods();

  final Map<String, String> errorCodes = {
    'wrong-passord':
        'Sorry. The password you entered is incorrect for the given mail',
    'invalid-email': 'Sorry. The provided email is invalid',
    'user-disabled': 'The given email is disabled. Please contact support',
    'user-not-found': 'The user with given email doesn\'t exist',
    'email-already-in-use': 'The email you have provided is already in use',
    'weak-password':
        'The entered password is not strong. Please enter a strong password'
  };

  Future<String> loginMethod(
      {required String email, required String password}) async {
    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (cred.user!.uid.isNotEmpty) {
        return 'success';
      }
      return 'failed';
    } on FirebaseAuthException catch (e) {
      return errorCodes[e.code] ?? 'Failed! Check your credientials';
    }
  }

  Future<String> registerMethod(
      {required String email,
      required String name,
      required String phone,
      required String password}) async {
    try {
      UserCredential crediential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (crediential.user!.uid.isNotEmpty) {
        await _firestoreMethods.storeUserInfo(
            name: name,
            email: email,
            password: password,
            phone: phone,
            uid: AuthMethods().gerUserId);
        return 'success';
      }
      return 'failed';
    } on FirebaseAuthException catch (e) {
      return errorCodes[e] ?? 'Failed. Check your credientials';
    }
  }

  String get gerUserId {
    return _auth.currentUser!.uid;
  }

  bool get authState{
    if (_auth.currentUser != null) {
      return true;
    }
    return false;
  }
}
