import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tabungan_kita/authentication_service.dart';
import 'package:toast/toast.dart';

class AccountTab extends StatelessWidget {
  final _newPasswordForm = GlobalKey<FormState>();
  String _newPassword;

  @override
  Widget build(BuildContext context) {
    String name = "Bagus Darmawan";
    bool isMember = false;

    // Widget Theme
    double _borderRad = 10.0;
    double _cardElevation = 0.0;
    Color backgroundColor = Color.fromRGBO(230, 230, 230, 1);
    Color primaryColor = Colors.blueAccent;
    // Color secondaryColor = Colors.white;
    Color iconColor = Colors.blueAccent;

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
                                            BorderRadius.circular(_borderRad))),
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
                                      context.read<AuthenticationService>().changePassword(_newPassword);
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
                                            BorderRadius.circular(_borderRad))),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_borderRad),
                ),
                actions: <Widget>[
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(_borderRad),
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

    Widget _checkMemberStatus() {
      return ButtonTheme(
        minWidth: 500,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_borderRad),
              side: BorderSide(color: primaryColor)),
          onPressed: () {},
          color: Colors.white,
          textColor: primaryColor,
          child: Text('Aktivasi Sekarang'.toUpperCase()),
        ),
      );
    }

    Widget _deviceConnection() {
      return Card(
        elevation: _cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRad),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                trailing: isMember
                    ? FaIcon(
                        FontAwesomeIcons.userCheck,
                        color: Colors.green,
                      )
                    : FaIcon(FontAwesomeIcons.userTimes, color: Colors.red),
                title: Text(name),
                subtitle: isMember ? Text("Member") : Text("Bukan Member"),
              ),
              if (!isMember) _checkMemberStatus(),
            ],
          ),
        ),
      );
    }

    Widget _userProfile() {
      return Card(
        elevation: _cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRad),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text('Profil Pengguna'),
              ),
              Card(
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_borderRad),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text("Informasi Umum"),
                      ),
                      ListTile(
                          leading: FaIcon(
                            FontAwesomeIcons.idCard,
                            color: iconColor,
                          ),
                          title: Text("NIK"),
                          subtitle: Text("**** 1234")),
                      ListTile(
                          leading: FaIcon(FontAwesomeIcons.creditCard,
                              color: iconColor),
                          title: Text("Nomor Rekening"),
                          subtitle: Text("**** 1234")),
                      ListTile(
                          leading:
                              FaIcon(FontAwesomeIcons.phone, color: iconColor),
                          title: Text("Nomor Telepon"),
                          subtitle: Text("+62 **** 1234")),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_borderRad),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text("Informasi Mahasiswa"),
                      ),
                      ListTile(
                          leading: FaIcon(FontAwesomeIcons.university,
                              color: iconColor),
                          title: Text("Kampus"),
                          subtitle: Text("Universitas Jember")),
                      ListTile(
                          leading: FaIcon(FontAwesomeIcons.userGraduate,
                              color: iconColor),
                          title: Text("Jenjang/Jurusan"),
                          subtitle: Text("S1 Informatika")),
                      ListTile(
                          leading: FaIcon(FontAwesomeIcons.idBadge,
                              color: iconColor),
                          title: Text("NIM"),
                          subtitle: Text("1824101030xx")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget _accountSetting() {
      return Card(
        elevation: _cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRad),
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
                initialValue: context.select((AuthenticationService auth) => auth.getEmail()),
                enabled: false,
                decoration: InputDecoration(
                    labelText: "Email",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(_borderRad))),
              ),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_borderRad),
                      side: BorderSide(color: primaryColor)),
                  onPressed: () {
                    _changePasswordDialog();
                  },
                  color: primaryColor,
                  textColor: Colors.white,
                  child: Text('Ubah Sandi'.toUpperCase()),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget _signOut() {
      return ButtonTheme(
        minWidth: MediaQuery.of(context).size.width,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_borderRad),
              side: BorderSide(color: Colors.redAccent)),
          onPressed: () {
            context.read<AuthenticationService>().signOut();
            // Navigator.of(context).pushNamed(SignIn.tag);
          },
          color: Colors.redAccent,
          textColor: Colors.white,
          child: Text('Sign Out'.toUpperCase()),
        ),
      );
    }

    return Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: backgroundColor,
          child: new Column(
            children: [
              _deviceConnection(),
              _userProfile(),
              _accountSetting(),
              _signOut(),
            ],
          ),
        ),
      ),
    );
  }
}
