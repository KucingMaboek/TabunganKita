import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabungan_kita/models/user_model.dart';
import 'package:tabungan_kita/services/database_services.dart';
import 'package:toast/toast.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  String _userEmail;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      _userEmail = _firebaseAuth.currentUser.email;
      print(_userEmail);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password, UserModel userModel}) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
            DatabaseService.createOrUpdateUser(user.user.uid, userModel, false);
      });
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signOut() async {
    await _firebaseAuth.signOut();
    return "Signed out";
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  void changePassword(String newPassword) {
    _firebaseAuth.currentUser.updatePassword(newPassword);
  }

  String getEmail() {
    return _userEmail;
  }
}
