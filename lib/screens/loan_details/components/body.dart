import 'package:flutter/material.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/models/loan_model.dart';
import 'package:tabungan_kita/screens/loan_details/components/button_pay.dart';
import 'package:tabungan_kita/screens/loan_details/components/receipt.dart';

class Body extends StatelessWidget {
  final LoanModel model;

  Body(this.model);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        child: Stack(
          children: [
            Container(
              height: 125.0,
              decoration: new BoxDecoration(
                color: kPrimaryColor,
                borderRadius: new BorderRadius.vertical(
                    bottom: new Radius.elliptical(
                        MediaQuery.of(context).size.width, 10.0)),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  Receipt(model),
                  ButtonPay(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
