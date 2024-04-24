import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hopitalyasser/Pages/Settings.dart';
import 'package:hopitalyasser/Pages/reservation.dart';

class HomeP extends StatefulWidget {
  const HomeP({super.key});

  @override
  State<HomeP> createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  int _currentPage = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Reservation(),
    Nurses(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      body: Center(
        child: _widgetOptions.elementAt(_currentPage),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        child: GNav(
            selectedIndex: _currentPage,
            tabBorderRadius: 20,
            backgroundColor: Color.fromARGB(255, 133, 138, 227),
            color: Colors.white,
            activeColor: Color.fromARGB(255, 44, 7, 53),
            tabBackgroundColor: Colors.white24,
            padding: EdgeInsets.all(20),
            rippleColor: Color.fromARGB(255, 44, 7, 53).withOpacity(0.1),
            gap: 8,
            onTabChange: _onItemTapped,
            tabs: [
              GButton(
                icon: Icons.person_2_outlined,
                text: 'Reservation',
              ),
              GButton(
                icon: Icons.medical_information_outlined,
                text: 'Nurses',
              ),
              GButton(
                icon: Icons.settings_outlined,
                text: 'Settings',
              )
            ]),
      ),
    );
  }
}
