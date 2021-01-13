import 'package:flutter/material.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/models/loan_model.dart';
import 'package:tabungan_kita/screens/loan_details/components/body.dart';

class LoanDetail extends StatelessWidget {
  final String id;
  final LoanModel model;

  LoanDetail(this.id, this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Detail Pinjaman',
              style: TextStyle(color: Colors.white)),
          backgroundColor: kPrimaryColor),
      backgroundColor: kBackgroundColor,
      body: Body(id, model),
    );
  }
}
