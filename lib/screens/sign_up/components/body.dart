import 'package:flutter/material.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/screens/sign_up/components/sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: kPrimaryColor,
      child: Center(
        child: SingleChildScrollView(
          child: Container(

            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRad),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 48.0,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    SizedBox(height: 12.0),
                    SignForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
