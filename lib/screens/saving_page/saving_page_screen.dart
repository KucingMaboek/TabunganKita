import 'package:flutter/material.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/screens/saving_page/components/body.dart';

class SavingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Body(),
    );
  }
}
