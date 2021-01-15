import 'package:flutter/material.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/screens/sign_in/components/sign_form.dart';
import 'package:tabungan_kita/screens/sign_up/sign_up_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color: kPrimaryColor,
          child: Center(
              child: SingleChildScrollView(
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 24),
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
                          radius: 50,
                          child: Image.asset("assets/images/logo.png"),
                        ),
                        SizedBox(height: 24.0),
                        SignForm(),
                        FlatButton(
                          child: Text(
                            "Tidak memiliki akun? Daftar sekarang!",
                            style: TextStyle(color: Colors.black54),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SignUpScreen.routeName);
                          },
                        ),
                      ],
                    ),
                  ),
              ),
            ),
          )),
    );
  }
}
