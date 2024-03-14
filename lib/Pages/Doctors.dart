import 'package:flutter/material.dart';

class Doctors extends StatefulWidget {
  const Doctors({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 253, 240, 213).withOpacity(0.1),
        title: Text(
          'DOCTORS',
          style: TextStyle(letterSpacing: 1),
        ),
        centerTitle: true,
      ),
    );
  }
}
