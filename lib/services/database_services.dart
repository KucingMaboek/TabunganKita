import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabungan_kita/models/loan_model.dart';
import 'package:tabungan_kita/models/saving_model.dart';
import 'package:tabungan_kita/models/user_model.dart';

class DatabaseService {
  static var firebaseUser = FirebaseAuth.instance.currentUser;
  static CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");
  static CollectionReference savingsCollection =
      FirebaseFirestore.instance.collection("savings");
  static CollectionReference loansCollection =
      FirebaseFirestore.instance.collection("loans");

  static void createOrUpdateSaving(
      String id, SavingModel model, bool isMerged) async {
    savingsCollection.doc(id).set(model.toMap(), SetOptions(merge: isMerged));
  }

  static dynamic getSavings() {
    return savingsCollection
        .where("userId", isEqualTo: DatabaseService.firebaseUser.uid)
        .snapshots();
  }

  static Future<void> deleteSaving(String id) async {
    await savingsCollection.doc(id).delete();
  }

  static void createOrUpdateLoan(
      String id, LoanModel model, bool isMerged) async {
    loansCollection.doc(id).set(model.toMap(), SetOptions(merge: isMerged));
  }

  static dynamic getLoans() {
    return loansCollection
        .where("userId", isEqualTo: DatabaseService.firebaseUser.uid)
        .snapshots();
  }

  static Future<void> deleteLoan(String id) async {
    await loansCollection.doc(id).delete();
  }

  static void createOrUpdateUser(
      String userId, UserModel userModel, bool isMerged) async {
    usersCollection
        .doc(userId)
        .set(userModel.toMap(), SetOptions(merge: isMerged));
  }

  static dynamic getUser() {
    return usersCollection.doc(firebaseUser.uid).snapshots();
  }

  // static dynamic getUser() {
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(FirebaseAuth.instance.currentUser.uid)
  //       .get()
  //       .then((value) {
  //     return value.data();
  //   });
  // }

  static Future<void> deleteUser(String userId) async {
    await usersCollection.doc(userId).delete();
  }
}
