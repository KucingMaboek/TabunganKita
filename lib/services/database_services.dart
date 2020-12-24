import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabungan_kita/models/saving_model.dart';
import 'package:tabungan_kita/models/user_model.dart';

class DatabaseService {
  static var firebaseUser = FirebaseAuth.instance.currentUser;
  static CollectionReference productColection =
      FirebaseFirestore.instance.collection("products");
  static CollectionReference usersColection =
      FirebaseFirestore.instance.collection("users");
  static CollectionReference savingsColection =
      FirebaseFirestore.instance.collection("savings");

  static Future<void> createOrUpdateProduct(
      String id, String name, int price, bool isMerged) async {
    await productColection.doc(id).set({
      'nama': name,
      'harga': price,
    }, SetOptions(merge: isMerged));
  }

  static Future<DocumentSnapshot> getProduct(String id) async {
    return await productColection.doc(id).get();
  }

  static Future<void> deleteProduct(String id) async {
    await productColection.doc(id).delete();
  }

  static dynamic getSavings() {
    return savingsColection
        .where("userId", isEqualTo: DatabaseService.firebaseUser.uid)
        .snapshots();
  }

  static Future<List<SavingModel>> getSavingList() async {

  }

  static void createOrUpdateUser(UserModel userModel, bool isMerged) async {
    usersColection
        .doc(firebaseUser.uid)
        .set(userModel.toMap(), SetOptions(merge: isMerged));
  }

  // static Future <DocumentSnapshot> getUser() async {
  //   return await usersColection.doc(firebaseUser.uid).get();
  // }

  static dynamic getUser() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      return value.data();
    });
  }

  static Future<void> deleteUser(String userId) async {
    await usersColection.doc(userId).delete();
  }
}
