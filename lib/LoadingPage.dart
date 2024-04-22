import 'package:flutter/material.dart';
import 'package:hopitalyasser/LoginPage.dart';
import 'package:hopitalyasser/MedicalDataBase.dart'; // Assuming this class has a method for checking the first launch.
import 'package:hopitalyasser/PageOfRules.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future<bool> _isFirstLaunch() async {
    // Use Provider to access the MedicalDatabase class's method for first launch.
    return await context.read<MedicalDatabase>().isitfirstLaunch();
  }

  Future<void> showAnimationAndPush() async {
    final firstLaunch = await _isFirstLaunch();
    await Future.delayed(
        const Duration(seconds: 3)); // Await a little to show the animation
    if (firstLaunch) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PageOFRules()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showAnimationAndPush(); // Calling this method in a delayed manner to safely interact with Provider
    });
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
        ),
      ),
    );
  }
}
