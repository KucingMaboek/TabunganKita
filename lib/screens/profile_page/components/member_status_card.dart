import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tabungan_kita/constants.dart';

class MemberStatusCard extends StatefulWidget {
  @override
  _MemberStatusCardState createState() => _MemberStatusCardState();
}

class _MemberStatusCardState extends State<MemberStatusCard> {
  String name = "Bagus Darmawan";
  bool isMember = false;

  @override
  Widget build(BuildContext context) {
    Widget _checkMemberStatus() {
      return ButtonTheme(
        minWidth: 500,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorderRad),
              side: BorderSide(color: kPrimaryColor)),
          onPressed: () {},
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
              title: Text(name),
              subtitle: isMember ? Text("Member") : Text("Bukan Member"),
            ),
            if (!isMember) _checkMemberStatus(),
          ],
        ),
      ),
    );
  }
}
