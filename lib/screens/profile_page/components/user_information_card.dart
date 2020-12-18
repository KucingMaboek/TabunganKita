import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tabungan_kita/constants.dart';

class UserInformationCard extends StatefulWidget{
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
                              subtitle: Text("**** 1234")),
                          ListTile(
                              leading: FaIcon(FontAwesomeIcons.creditCard,
                                  color: kIconColor),
                              title: Text("Nomor Rekening"),
                              subtitle: Text("**** 1234")),
                          ListTile(
                              leading:
                              FaIcon(FontAwesomeIcons.phone, color: kIconColor),
                              title: Text("Nomor Telepon"),
                              subtitle: Text("+62 **** 1234")),
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
                              subtitle: Text("Universitas Jember")),
                          ListTile(
                              leading: FaIcon(FontAwesomeIcons.userGraduate,
                                  color: kIconColor),
                              title: Text("Jenjang/Jurusan"),
                              subtitle: Text("S1 Informatika")),
                          ListTile(
                              leading: FaIcon(FontAwesomeIcons.idBadge,
                                  color: kIconColor),
                              title: Text("NIM"),
                              subtitle: Text("1824101030xx")),
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