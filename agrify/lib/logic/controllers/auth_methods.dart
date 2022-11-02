import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final _auth = FirebaseAuth.instance;

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
}
