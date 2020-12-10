import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tabungan_kita/AccountTab.dart';
import 'package:tabungan_kita/LoanTab.dart';
import 'package:tabungan_kita/SavingTab.dart';

class Home extends StatefulWidget {
  static String tag = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final _pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Tabungan Kita",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          SavingTab(),
          LoanTab(),
          AccountTab(),
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.donate),
              label: "Simpanan Wajib",
              backgroundColor: Colors.lightGreen),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.handHoldingUsd),
              label: "Pinjaman",
              backgroundColor: Colors.redAccent),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.userAlt),
              label: "Akun",
              backgroundColor: Colors.blueAccent)
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(_selectedIndex,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
      ),
    );
  }
}
