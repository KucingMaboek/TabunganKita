import 'package:flutter/material.dart';
import 'package:tabungan_kita/screens/sign_up/components/body.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = '/sign_up';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: Body());
  }
}
