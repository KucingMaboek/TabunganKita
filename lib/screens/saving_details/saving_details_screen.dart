import 'package:flutter/material.dart';
import 'package:tabungan_kita/models/saving_model.dart';
import 'package:tabungan_kita/screens/saving_details/components/body.dart';

class SavingDetail extends StatelessWidget {
  final SavingModel model;

  SavingDetail(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Detail Simpanan Wajib',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.lightGreen),
      body: Body(model),
    );
  }
}
