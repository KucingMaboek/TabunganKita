import 'package:flutter/material.dart';
import 'package:tabungan_kita/screens/sign_in/components/sign_form.dart';
import 'package:tabungan_kita/screens/sign_up/sign_up_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      child: Padding(
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: 'hero',
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 48.0,
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              SizedBox(height: 48.0),
              SignForm(),
              FlatButton(
                child: Text(
                  "Don't have an account yet? Sign Up Now.",
                  style: TextStyle(color: Colors.black54),
                ),
                onPressed: () {Navigator.pushNamed(context, SignUpScreen.routeName);},
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
