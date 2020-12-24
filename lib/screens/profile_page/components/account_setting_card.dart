import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/services/authentication_service.dart';
import 'package:toast/toast.dart';

class AccountSettingCard extends StatefulWidget {
  final String email;

  AccountSettingCard(this.email);

  @override
  _AccountSettingCardState createState() => _AccountSettingCardState();
}

class _AccountSettingCardState extends State<AccountSettingCard> {
  final _newPasswordForm = GlobalKey<FormState>();
  String _newPassword;

  @override
  Widget build(BuildContext context) {
    _changePasswordDialog() {
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
                title: new Text("Ubah Sandi"),
                content: Container(
                  child: Wrap(
                    children: [
                      Form(
                          key: _newPasswordForm,
                          child: Column(
                            children: [
                              TextFormField(
                                obscureText: true,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Mohon diisi';
                                  } else {
                                    _newPassword = value;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: "Password Baru",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(kBorderRad))),
                                textInputAction: TextInputAction.next,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                obscureText: true,
                                validator: (value) {
                                  if (value.isNotEmpty) {
                                    if (value == _newPassword) {
                                      context
                                          .read<AuthenticationService>()
                                          .changePassword(_newPassword);
                                      Toast.show("Berhasil mengubah password! ",
                                          context,
                                          duration: Toast.LENGTH_LONG,
                                          gravity: Toast.BOTTOM);
                                      Navigator.pop(context);
                                    } else {
                                      return 'Password tidak sama';
                                    }
                                  } else {
                                    return 'Mohon diisi';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    labelText: "Konfirmasi Password Baru",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(kBorderRad))),
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
                          borderRadius: BorderRadius.circular(kBorderRad),
                          side: BorderSide(color: Colors.redAccent)),
                      onPressed: () {
                        _newPasswordForm.currentState.validate();
                      },
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      child: Text('Konfirmasi'.toUpperCase()),
                    ),
                  ),
                ],
              ));
    }

    return Card(
      elevation: kCardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRad),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('Pengaturan Akun'),
            ),
            TextFormField(
              autofocus: false,
              initialValue: widget.email,
              enabled: false,
              decoration: InputDecoration(
                  labelText: "Email",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
                  _changePasswordDialog();
                },
                color: kPrimaryColor,
                textColor: Colors.white,
                child: Text('Ubah Sandi'.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
