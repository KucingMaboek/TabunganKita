import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/models/user_model.dart';
import 'package:tabungan_kita/services/authentication_service.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _signUpForm = GlobalKey<FormState>();
  String _email,
      _password,
      _name,
      _nik,
      _accountNumber,
      _bank,
      _phone,
      _university,
      _degree,
      _major,
      _studentId;
  bool _passwordConfirm;

  Widget AccountField() {
    return Card(
        color: kBackgroundColor,
        elevation: kCardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRad),
        ),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                // Header
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text("Informasi Akun".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  height: 3.0,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  height: 5.0,
                ),

                // Form Content
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

                // Password Field
                SizedBox(height: 8.0),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      _password = null;
                      return 'Mohon diisi';
                    } else {
                      if (value.length < 8) {
                        return "Password tidak boleh kurang dari 8 huruf";
                      } else {
                        _password = value;
                      }
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "ex: 12345678",
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRad))),
                  textInputAction: TextInputAction.next,
                ),

                // Rewrite Password Field
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
                  textInputAction: TextInputAction.next,
                ),
              ],
            )));
  }

  Widget UserInformation() {
    return Card(
        color: kBackgroundColor,
        elevation: kCardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRad),
        ),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                // Header
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text("Informasi Pengguna".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  height: 3.0,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  height: 5.0,
                ),

                // Form Content
                TextFormField(
                  validator: (value) {
                    if (!value.isEmpty) {
                      _name = value;
                    } else {
                      return 'Mohon diisi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Nama",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRad))),
                  textInputAction: TextInputAction.next,
                ),

                // NIK Field
                SizedBox(height: 8.0),
                TextFormField(
                  validator: (value) {
                    if (!value.isEmpty) {
                      _nik = value;
                    } else {
                      return 'Mohon diisi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "NIK ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRad))),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  validator: (value) {
                    if (!value.isEmpty) {
                      _phone = value;
                    } else {
                      return 'Mohon diisi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Nomer Telepon",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRad))),
                  textInputAction: TextInputAction.next,
                ),
              ],
            )));
  }

  Widget BankInformation() {
    return Card(
        color: kBackgroundColor,
        elevation: kCardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRad),
        ),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                // Header
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text("Informasi Akun Bank".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  height: 3.0,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  height: 5.0,
                ),

                // Form Content
                TextFormField(
                  validator: (value) {
                    if (!value.isEmpty) {
                      _bank = value;
                    } else {
                      return 'Mohon diisi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Bank ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRad))),
                  textInputAction: TextInputAction.next,
                ),

                // Bank Account Number Field
                SizedBox(height: 8.0),
                TextFormField(
                  validator: (value) {
                    if (!value.isEmpty) {
                      _accountNumber = value;
                    } else {
                      return 'Mohon diisi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Nomer Rekening ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRad))),
                  textInputAction: TextInputAction.next,
                )
              ],
            )));
  }

  Widget StudentInformation() {
    return Card(
        color: kBackgroundColor,
        elevation: kCardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRad),
        ),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                // Header
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text("Informasi Mahasiswa".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  height: 3.0,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  height: 5.0,
                ),

                // Form Content
                TextFormField(
                  validator: (value) {
                    if (!value.isEmpty) {
                      _university = value;
                    } else {
                      return 'Mohon diisi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Universitas",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRad))),
                  textInputAction: TextInputAction.next,
                ),

                // Degree Field
                SizedBox(height: 8.0),
                TextFormField(
                  validator: (value) {
                    if (!value.isEmpty) {
                      _degree = value;
                    } else {
                      return 'Mohon diisi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Jenjang",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRad))),
                  textInputAction: TextInputAction.next,
                ),

                // Major Field
                SizedBox(height: 8.0),
                TextFormField(
                  validator: (value) {
                    if (!value.isEmpty) {
                      _major = value;
                    } else {
                      return 'Mohon diisi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Jurusan",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRad))),
                  textInputAction: TextInputAction.next,
                ),

                // NIM Field
                SizedBox(height: 8.0),
                TextFormField(
                  validator: (value) {
                    if (!value.isEmpty) {
                      _studentId = value;
                    } else {
                      return 'Mohon diisi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "NIM",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kBorderRad))),
                  textInputAction: TextInputAction.next,
                )
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _signUpForm,
      child: Column(
        children: <Widget>[
          AccountField(),
          UserInformation(),
          BankInformation(),
          StudentInformation(),

          // Confirm Button
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kBorderRad),
                  side: BorderSide(color: kPrimaryColor)),
              onPressed: () {
                _signUpForm.currentState.validate();
                if (_email.isNotEmpty && _passwordConfirm) {
                  // Create user model
                  UserModel newUser = new UserModel(
                      _email,
                      _name,
                      _nik,
                      {
                        "accountNumber": _accountNumber,
                        "alias": _name,
                        "bank": _bank
                      },
                      _phone,
                      _university,
                      _degree,
                      _major,
                      _studentId,
                      "Belum Aktivasi",
                      "");

                  // Make new user
                  context.read<AuthenticationService>().signUp(
                      email: _email, password: _password, userModel: newUser);

                  // Done
                  Navigator.pop(context);
                }
              },
              color: kPrimaryColor,
              textColor: Colors.white,
              child: Text('Daftar'.toUpperCase()),
            ),
          ),
        ],
      ),
    );
  }
}
