import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 188, 108, 37),
        foregroundColor: Color.fromARGB(255, 254, 250, 224),
        title: Text(
          'HospitalYasser',
        ),
        centerTitle: true,
      ),
    );
  }
}
