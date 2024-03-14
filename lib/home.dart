import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hopitalyasser/Pages/Doctors.dart';
import 'package:hopitalyasser/Pages/Patients.dart';
import 'package:hopitalyasser/Pages/Settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  List<Widget> Page = [
    Patients(),
    Doctors(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      body: Page[_currentPage],
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
            onTabChange: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            tabs: [
              GButton(
                icon: Icons.person_2_outlined,
                text: 'Patients',
              ),
              GButton(
                icon: Icons.medical_information_outlined,
                text: 'Doctors',
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
