import 'package:flutter/material.dart';
import 'package:tabungan_kita/models/saving_model.dart';
import 'package:tabungan_kita/screens/saving_details/components/receipt.dart';

class Body extends StatelessWidget {
  final SavingModel model;

  Body(this.model);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: new BoxConstraints.expand(),
        color: Colors.white,
        child: new Stack(
          children: [
            Container(
              color: Colors.white,
            ),
            Container(
              height: 125.0,
              decoration: new BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: new BorderRadius.vertical(
                    bottom: new Radius.elliptical(
                        MediaQuery.of(context).size.width, 10.0)),
              ),
            ),
            Receipt(model),
          ],
        ),
      ),
    );
  }
}
