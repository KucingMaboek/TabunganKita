import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/screens/sign_in/components/reset_form.dart';
import 'package:tabungan_kita/services/authentication_service.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _signInForm = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signInForm,
      child: Column(
        children: <Widget>[
          TextFormField(
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
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kBorderRad))),
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 8.0),
          TextFormField(
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
                counter: ResetForm(),
                hintText: "ex: 12345678",
                labelText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kBorderRad))),
          ),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kBorderRad),
                  side: BorderSide(color: kPrimaryColor)),
              onPressed: () {
                _signInForm.currentState.validate();
                if (_email.isNotEmpty && _password.isNotEmpty) {
                  context.read<AuthenticationService>().signIn(
                        email: _email,
                        password: _password,
                      );
                }
              },
              color: kPrimaryColor,
              textColor: Colors.white,
              child: Text('Masuk'.toUpperCase()),
            ),
          ),
        ],
      ),
    );
  }
}
