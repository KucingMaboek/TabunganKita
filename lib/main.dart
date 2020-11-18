import 'package:flutter/material.dart';
import 'package:tabungan_kita/Home.dart';
import 'package:tabungan_kita/Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final routes = <String, WidgetBuilder>{
    Login.tag: (context) => Login(),
    Home.tag: (context) => Home(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabungan Kita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        // fontFamily: 'Nunito',
      ),
      home: Login(),
      routes: routes,
    );
  }
}