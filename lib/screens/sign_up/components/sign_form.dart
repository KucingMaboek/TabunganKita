import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/services/authentication_service.dart';
import 'package:toast/toast.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _signUpForm = GlobalKey<FormState>();
  String _email, _password;
  bool _passwordConfirm;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _signUpForm,
      child: Column(
        children: <Widget>[
          TextFormField(
            obscureText: false,
            validator: (value) {
              if (value.isEmpty) {
                return 'Mohon diisi';
              } else {
                RegExp regex = new RegExp(kEmailPattern);
                if (regex.hasMatch(value)) {
                  _email = value;
                } else {
                  _email = null;
                  return "Email tidak valid";
                }
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "ex: test@mail.com",
                labelText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kBorderRad))),
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 8.0),
          TextFormField(
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                _password = null;
                return 'Mohon diisi';
              } else {
                _password = value;
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "ex: 123456",
                labelText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kBorderRad))),
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 8.0),
          TextFormField(
            obscureText: true,
            validator: (value) {
              if (!value.isEmpty) {
                if (value == _password) {
                  _passwordConfirm = true;
                } else {
                  return 'Password tidak sama';
                }
              } else {
                return 'Mohon diisi';
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: "Konfirmasi Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kBorderRad))),
          ),
          SizedBox(height: 24.0),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kBorderRad),
                  side: BorderSide(color: kPrimaryColor)),
              onPressed: () {
                _signUpForm.currentState.validate();
                if (_email.isNotEmpty && _passwordConfirm) {
                  context.read<AuthenticationService>().signUp(
                        email: _email,
                        password: _password,
                      );
                  Toast.show("Berhasil membuat akun", context);
                  Navigator.pop(context); 
                }
              },
              color: kPrimaryColor,
              textColor: Colors.white,
              child: Text('Sign Up'.toUpperCase()),
            ),
          ),
        ],
      ),
    );
  }
}
