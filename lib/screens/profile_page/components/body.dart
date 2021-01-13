import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/models/user_model.dart';
import 'package:tabungan_kita/screens/profile_page/components/account_setting_card.dart';
import 'package:tabungan_kita/screens/profile_page/components/member_status_card.dart';
import 'package:tabungan_kita/screens/profile_page/components/user_information_card.dart';
import 'package:tabungan_kita/services/authentication_service.dart';
import 'package:tabungan_kita/services/database_services.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: StreamBuilder<DocumentSnapshot>(
                    stream: DatabaseService.getUser(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        UserModel user =
                            UserModel.fromMap(snapshot.data.data());
                        return Column(
                          children: [
                            MemberStatusCard(user),
                            UserInformationCard(user),
                            AccountSettingCard(user.email),
                            ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(kBorderRad),
                                    side: BorderSide(color: Colors.redAccent)),
                                onPressed: () {
                                  context
                                      .read<AuthenticationService>()
                                      .signOut();
                                },
                                color: Colors.redAccent,
                                textColor: Colors.white,
                                child: Text('Sign Out'.toUpperCase()),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }))));
  }
}
