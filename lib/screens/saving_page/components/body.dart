import 'package:flutter/material.dart';
import 'package:tabungan_kita/screens/saving_page/components/saving_list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SavingList(),),
    );
  }
}
