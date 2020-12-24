import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/models/user_model.dart';
import 'package:tabungan_kita/screens/profile_page/components/account_setting_card.dart';
import 'package:tabungan_kita/screens/profile_page/components/member_status_card.dart';
import 'package:tabungan_kita/screens/profile_page/components/user_information_card.dart';
import 'package:tabungan_kita/services/authentication_service.dart';

class Body extends StatelessWidget {
  UserModel user = UserModel("email", "name", {"atm", "123456"}, "phone",
      "university", "degree", "major", "studentId", "memberStatus");

  var userData;
  DocumentSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      user = UserModel.fromMap(value.data());
    });

    // DatabaseService.createOrUpdateProduct("1", "masker", 2000, false);
    // DocumentSnapshot snapshot = context.read<DatabaseService>().getProduct("1");

    // print(DatabaseService.getUser());
    // user1 = UserModel.fromMap(DatabaseService.getUser());
    // user2 = new UserModel("email", "name", {"atm", "123456"}, "phone",
    //     "university", "degree", "major", "studentId", "memberStatus");

    // UserModel checkUser(){
    //   if(user1 != null){
    //     return user1;
    //   } else{
    //     return user2;
    //   }
    // }

    // print(userData);
    // print(DatabaseService.getUser());

    // user = UserModel.fromMap(user);
    // user = new UserModel("email", "name", {"atm","123456"}, "phone", "university", "degree", "major", "studentId", "memberStatus");
    // DocumentSnapshot snapshot = await DatabaseService.getUser();

    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        color: kBackgroundColor,
        child: Column(
          children: [
            MemberStatusCard(user),
            UserInformationCard(),
            AccountSettingCard(),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRad),
                    side: BorderSide(color: Colors.redAccent)),
                onPressed: () {
                  context.read<AuthenticationService>().signOut();
                },
                color: Colors.redAccent,
                textColor: Colors.white,
                child: Text('Sign Out'.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    ));

  }
}
