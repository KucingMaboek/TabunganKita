import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/models/user_model.dart';

class UserInformationCard extends StatefulWidget {
  final UserModel user;

  UserInformationCard(this.user);

  @override
  _UserInformationCardState createState() => _UserInformationCardState();
}

class _UserInformationCardState extends State<UserInformationCard> {
  @override
  Widget build(BuildContext context) {
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
              title: Text('Profil Pengguna'),
            ),
            Card(
              color: Colors.white70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRad),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text("Informasi Umum"),
                    ),
                    ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.idCard,
                          color: kIconColor,
                        ),
                        title: Text("NIK"),
                        subtitle: Text(widget.user.residentId)),
                    ListTile(
                        leading: FaIcon(FontAwesomeIcons.creditCard,
                            color: kIconColor),
                        title: Text("Rekening"),
                        subtitle: Text(widget.user.atm['bank'] + " | " + widget.user.atm['accountNumber'])),
                    ListTile(
                        leading:
                            FaIcon(FontAwesomeIcons.phone, color: kIconColor),
                        title: Text("Nomor Telepon"),
                        subtitle: Text(widget.user.phone)),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRad),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text("Informasi Mahasiswa"),
                    ),
                    ListTile(
                        leading: FaIcon(FontAwesomeIcons.university,
                            color: kIconColor),
                        title: Text("Kampus"),
                        subtitle: Text(widget.user.university)),
                    ListTile(
                        leading: FaIcon(FontAwesomeIcons.userGraduate,
                            color: kIconColor),
                        title: Text("Jenjang/Jurusan"),
                        subtitle: Text(widget.user.degree + " " + widget.user.major)),
                    ListTile(
                        leading:
                            FaIcon(FontAwesomeIcons.idBadge, color: kIconColor),
                        title: Text("NIM"),
                        subtitle: Text(widget.user.studentId)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
