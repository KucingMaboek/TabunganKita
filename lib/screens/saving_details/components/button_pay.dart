import 'package:flutter/material.dart';
import 'package:tabungan_kita/constants.dart';

class ButtonPay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRad),
            side: BorderSide(color: Colors.redAccent)),
        onPressed: () {},
        color: Colors.redAccent,
        textColor: Colors.white,
        child: Text('Bayar'.toUpperCase()),
      ),
    );
  }
}
