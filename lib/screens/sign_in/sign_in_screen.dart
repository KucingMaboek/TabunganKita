import 'package:flutter/material.dart';
import 'package:tabungan_kita/screens/sign_in/components/body.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = '/sign_in';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: Body());
  }
}
