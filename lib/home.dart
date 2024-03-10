import 'package:flutter/material.dart';
import 'package:';

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
        backgroundColor: Color.fromARGB(255, 42, 157, 143),
        foregroundColor: Color.fromARGB(255, 233, 196, 106),
        title: Text(
          'HospitalYasser',
          
        ),
        centerTitle: true,
      ),
    );
  }
}
