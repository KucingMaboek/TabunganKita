import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabungan_kita/models/user_model.dart';

class DatabaseService {
  static var firebaseUser = FirebaseAuth.instance.currentUser;
  static CollectionReference productCollection =
      FirebaseFirestore.instance.collection("products");
  static CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");
  static CollectionReference savingsCollection =
      FirebaseFirestore.instance.collection("savings");
  static CollectionReference loansCollection =
      FirebaseFirestore.instance.collection("loans");

  static Future<void> createOrUpdateProduct(
      String id, String name, int price, bool isMerged) async {
    await productCollection.doc(id).set({
      'nama': name,
      'harga': price,
    }, SetOptions(merge: isMerged));
  }

  static Future<DocumentSnapshot> getProduct(String id) async {
    return await productCollection.doc(id).get();
  }

  static Future<void> deleteProduct(String id) async {
    await productCollection.doc(id).delete();
  }

  static dynamic getSavings() {
    return savingsCollection
        .where("userId", isEqualTo: DatabaseService.firebaseUser.uid)
        .snapshots();
  }

  static dynamic getLoans() {
    return loansCollection
        .where("userId", isEqualTo: DatabaseService.firebaseUser.uid)
        .snapshots();
  }

  static void createOrUpdateUser(String userId, UserModel userModel, bool isMerged) async {
    usersCollection
        .doc(userId)
        .set(userModel.toMap(), SetOptions(merge: isMerged));
  }

  static dynamic getUser() {
    return usersCollection.doc(firebaseUser.uid)
        .snapshots();
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
