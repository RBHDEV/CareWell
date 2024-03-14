import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 253, 240, 213).withOpacity(0.1),
        title: Text(
          'SETTINGS',
          style: TextStyle(letterSpacing: 1),
        ),
        centerTitle: true,
      ),
    );
  }
}
