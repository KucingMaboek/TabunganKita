import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  static String tag = 'sign_up';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset("lib/assets/images/logo.png"),
      ),
    );

    final body = Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          logo,
        ],
      ),
    );

    return Scaffold(backgroundColor: Colors.white, body: body);
  }
}
