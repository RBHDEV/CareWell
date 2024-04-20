import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hopitalyasser/MedicalDataBase.dart';
import 'package:hopitalyasser/home%20P.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MedicalDatabase.initialize();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

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
      title: 'HopitalYasser',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme, // Apply Roboto to the current text theme
        ),
      ),
      home: HomeP(),
    );
  }
}
