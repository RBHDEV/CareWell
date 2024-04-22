import 'package:flutter/material.dart';
import 'package:hopitalyasser/LoginPage.dart';
import 'package:hopitalyasser/PageOfRules.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  static Future<bool> _isFirstLaunch() async {
    // Implement your preferred logic to determine first launch
    // (e.g., SharedPreferences, local file existence)
    final prefs = await SharedPreferences.getInstance();
    return !prefs.containsKey('medicalAppLaunched');
  }

  Future<void> showAnimationAndPush() async {
    final firstLaunch = await _isFirstLaunch();
    if (firstLaunch) {
      await Future.delayed(Duration(seconds: 3));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      await Future.delayed(Duration(seconds: 3));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PageOFRules()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    showAnimationAndPush();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      body: Center(
          child: Lottie.asset(
        'animations/Animation.json',
        alignment: Alignment.center,
        height: 400,
      )),
    );
  }
}
