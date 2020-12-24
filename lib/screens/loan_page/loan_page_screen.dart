import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/screens/loan_page/components/body.dart';

class LoanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: FaIcon(FontAwesomeIcons.plus, color: Colors.white,),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
