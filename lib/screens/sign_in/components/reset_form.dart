import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/services/authentication_service.dart';
import 'package:toast/toast.dart';

class ResetForm extends StatefulWidget{
  @override
  _ResetFormState createState() => _ResetFormState();
}

class _ResetFormState extends State<ResetForm> {
  final _resetPasswordForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
      return FlatButton(
        child: Text(
          "Lupa Password?",
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
                                    context
                                        .read<
                                        AuthenticationService>()
                                        .resetPassword(value);
                                    Toast.show(
                                        "Password baru telah dikirim ke email anda",
                                        context,
                                        duration:
                                        Toast.LENGTH_LONG,
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
                                            kBorderRad))),
                                textInputAction:
                                TextInputAction.next,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kBorderRad),
                ),
                actions: <Widget>[
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(kBorderRad),
                          side: BorderSide(
                              color: Colors.redAccent)),
                      onPressed: () {
                        _resetPasswordForm.currentState
                            .validate();
                      },
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      child: Text('Reset'.toUpperCase()),
                    ),
                  ),
                ],
              ));
        },
      );
  }
}