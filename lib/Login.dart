import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabungan_kita/Home.dart';

class Login extends StatefulWidget {
  static String tag = 'login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

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

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginRectangleButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        shadowColor: Colors.lightBlueAccent.shade100,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            Navigator.of(context).pushNamed(Home.tag);
          },
          color: Colors.lightBlueAccent,
          textColor: Colors.white,
          child: Text('Log In'.toUpperCase()),
        ),
      ),
    );

    final loginRoundButton = RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: Colors.lightBlueAccent)),
      onPressed: () {
        Navigator.of(context).pushNamed(Home.tag);
      },
      color: Colors.lightBlueAccent,
      textColor: Colors.white,
      child: Text('Log In'.toUpperCase()),
    );

    final registerLabel = FlatButton(
      child: Text(
        "Don't have an account yet? Register Now.",
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    final body = Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          logo,
          SizedBox(height: 48.0),
          email,
          SizedBox(height: 8.0),
          password,
          SizedBox(height: 24.0),
          // loginRectangleButton,
          loginRoundButton,
          registerLabel,
        ],
      ),
    );

    return Scaffold(
        key: _formKey,
        backgroundColor: Colors.white,
        body: body
    );
  }
}
