import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hopitalyasser/MedicalDataBase.dart';
import 'package:hopitalyasser/home.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MedicalDatabase.initialize();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  runApp(ChangeNotifierProvider(
    create: (context) => MedicalDatabase(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
