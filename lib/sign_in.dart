import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import 'authentication_service.dart';

class SignIn extends StatefulWidget {
  static String tag = 'sign_in';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _signInForm = GlobalKey<FormState>();
  String _email, _password;

  final _resetPasswordForm = GlobalKey<FormState>();

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

    final emailField = TextFormField(
      obscureText: false,
      validator: (value) {
        if (value.isEmpty) {
          return 'Mohon diisi';
        } else {
          _email = value;
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: "ex: test@mail.com",
          labelText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      textInputAction: TextInputAction.next,
    );

    final passwordField = TextFormField(
      obscureText: true,
      validator: (value) {
        if (value.isEmpty) {
          return 'Mohon diisi';
        } else {
          _password = value;
        }
        return null;
      },
      decoration: InputDecoration(
          counter: FlatButton(
            child: Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.black54),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                        title: new Text("Reset Password"),
                        content: Container(
                          child: Wrap(
                            children: [
                              Form(
                                  key: _resetPasswordForm,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        obscureText: false,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Mohon diisi';
                                          } else {
                                            context.read<AuthenticationService>().resetPassword(value);
                                            Toast.show("Password baru telah dikirim ke email anda",
                                                context,
                                                duration: Toast.LENGTH_LONG,
                                                gravity: Toast.BOTTOM);
                                            Navigator.pop(context);
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText: "ex: test@mail.com",
                                            labelText: "Email",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0))),
                                        textInputAction: TextInputAction.next,
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        actions: <Widget>[
                          ButtonTheme(
                            minWidth: MediaQuery.of(context).size.width,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.redAccent)),
                              onPressed: () {
                                _resetPasswordForm.currentState.validate();
                              },
                              color: Colors.redAccent,
                              textColor: Colors.white,
                              child: Text('Reset'.toUpperCase()),
                            ),
                          ),
                        ],
                      ));
            },
          ),
          hintText: "ex: 123456",
          labelText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      // textInputAction: TextInputAction.next,
    );

    final signInButton = ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.blueAccent)),
        onPressed: () {
          _signInForm.currentState.validate();
          if (_email.isNotEmpty && _password.isNotEmpty) {
            context.read<AuthenticationService>().signIn(
                  email: _email,
                  password: _password,
                );
          }
        },
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text('Sign In'.toUpperCase()),
      ),
    );

    final signUpButton = FlatButton(
      child: Text(
        "Don't have an account yet? Sign Up Now.",
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    final body = Center(
        child: Form(
      key: _signInForm,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          logo,
          SizedBox(height: 48.0),
          emailField,
          SizedBox(height: 8.0),
          passwordField,
          SizedBox(height: 24.0),
          signInButton,
          signUpButton,
        ],
      ),
    ));

    return Scaffold(backgroundColor: Colors.white, body: body);
  }
}
