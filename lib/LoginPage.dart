import 'package:flutter/material.dart';
import 'package:hopitalyasser/Pages/Nurses.dart';
import 'package:hopitalyasser/Pages/Patients.dart';
import 'package:hopitalyasser/home%20N.dart';
import 'package:hopitalyasser/home%20P.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  List<String> patientEmails = [
    'ramzibouhadjar@gmail.com',
    // add more patient emails
  ];

  List<String> nurseEmails = [
    'aymenmahmoud@gmail.com',
    // add more nurse emails
  ];

  void navigateBasedOnEmail(String email) {
    if (patientEmails.contains(email)) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeP()));
    } else if (nurseEmails.contains(email)) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeN()));
    } else {
      // Email not recognized
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Email not recognized')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.purple,
              Colors.blue,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 250,
                    child: Image.asset(
                      'assets/pfp.png',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Use the email to decide the navigation
                          navigateBasedOnEmail(emailController.text);
                        } else {
                          // Here, handle the error state or do nothing
                          print("Form is not valid");
                        }
                      },
                      child: Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
