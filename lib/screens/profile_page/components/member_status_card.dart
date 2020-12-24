import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/models/user_model.dart';
import 'package:tabungan_kita/services/database_services.dart';

class MemberStatusCard extends StatefulWidget {
  final UserModel user;
  MemberStatusCard(this.user);

  @override
  _MemberStatusCardState createState() => _MemberStatusCardState();
}

class _MemberStatusCardState extends State<MemberStatusCard> {

  // String name = "Bagus Darmawan";
  // String name = "Nama";
  bool isMember = false;

  // final firestoreInstance = FirebaseFirestore.instance;
  // var firebaseUser = FirebaseAuth.instance.currentUser;
  //
  // var user_data;

  @override
  Widget build(BuildContext context) {

    // firestoreInstance
    //     .collection("users")
    //     .doc(firebaseUser.uid)
    //     .get()
    //     .then((value) {
    //   user_data = value.data();
    //   name = user_data['name'].toString();
    //   // print(user_data['email']);
    // });

    Widget _checkMemberStatus() {
      return ButtonTheme(
        minWidth: 500,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorderRad),
              side: BorderSide(color: kPrimaryColor)),
          onPressed: () async {
            // firestoreInstance.collection("users").doc(firebaseUser.uid).set({
            //   "email": "test@mail.com",
            //   "name": "Bagus Darmawan",
            //   "atm": {
            //     "bank": "BCA",
            //     "alias": "Bagus Darmawan",
            //     "account_number": "1234432177"
            //   },
            //   "phone": "089600001234",
            //   "university": "Universitas Jember",
            //   "degree": "S1",
            //   "major": "Informatika",
            //   "student_id": "182410103000",
            //   "member_status": "Menunggu di verifikasi"
            // }).then((_) {
            //   print("success!");
            // });

            // DatabaseService.createOrUpdateProduct("1", "Masker", 2000, false);
          },
          color: Colors.white,
          textColor: kPrimaryColor,
          child: Text('Aktivasi Sekarang'.toUpperCase()),
        ),
      );
    }

    return Card(
      elevation: kCardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRad),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              trailing: isMember
                  ? FaIcon(
                      FontAwesomeIcons.userCheck,
                      color: Colors.green,
                    )
                  : FaIcon(FontAwesomeIcons.userTimes, color: Colors.red),
              // title: Text(name),
              title: Text(widget.user.name),
              subtitle: isMember ? Text("Member") : Text("Bukan Member"),
            ),
            if (!isMember) _checkMemberStatus(),
          ],
        ),
      ),
    );
  }
}
