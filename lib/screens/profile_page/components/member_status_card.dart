import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tabungan_kita/constants.dart';

class MemberStatusCard extends StatefulWidget {
  final String name;
  final String memberStatus;

  MemberStatusCard(this.name, this.memberStatus);

  @override
  _MemberStatusCardState createState() => _MemberStatusCardState();
}

class _MemberStatusCardState extends State<MemberStatusCard> {
  @override
  Widget build(BuildContext context) {
    Widget _checkMemberStatus() {
      return ButtonTheme(
        minWidth: 500,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorderRad),
              side: BorderSide(color: kPrimaryColor)),
          onPressed: () async {},
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
              trailing: widget.memberStatus != "Member"
                  ? FaIcon(
                      FontAwesomeIcons.userTimes,
                      color: Colors.red,
                    )
                  : FaIcon(FontAwesomeIcons.userCheck, color: Colors.green),
              title: Text(widget.name),
              subtitle: Text(widget.memberStatus),
            ),
            if (widget.memberStatus != "Member") _checkMemberStatus(),
          ],
        ),
      ),
    );
  }
}
