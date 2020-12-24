import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/screens/saving_page/saving_page_screen.dart';
import 'package:tabungan_kita/screens/loan_page/loan_page_screen.dart';
import 'package:tabungan_kita/screens/profile_page/profile_page_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          SavingPage(),
          LoanPage(),
          ProfilePage(),
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
              backgroundColor: kPrimaryColor),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.handHoldingUsd),
              label: "Pinjaman",
              backgroundColor: kPrimaryColor),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.userAlt),
              label: "Profil",
              backgroundColor: kPrimaryColor)
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
