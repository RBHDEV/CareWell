import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hopitalyasser/LoginPage.dart';

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
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 253, 240, 213).withOpacity(0.1),
        title: Text(
          'SETTINGS',
          style: TextStyle(letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 350,
            height: 500,
            color: Colors.deepPurple.shade200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 150,
                ),
                SizedBox(
                  height: 50,
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to Credits Page (dummy page here)
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreditsPage()),
                      );
                    },
                    child: Text("Credits"),
                  ),
                ),
                SizedBox(height: 20), // Spacing between buttons
                SizedBox(
                  height: 50,
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to Contacts Page (dummy page here)
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactsPage()),
                      );
                    },
                    child: Text("Contacts"),
                  ),
                ),
                SizedBox(height: 100), // Spacing between buttons
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      // Perform logout operation
                      logout(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                    ),
                    child: Text("Logout"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void logout(BuildContext context) async {
    // Placeholder function for logout logic
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Logout"),
        content: Text("You have been logged out."),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"),
          ),
        ],
      ),
    );
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}

class CreditsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Credits"),
        backgroundColor: Colors.deepPurple, // Custom color for the AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            profileWidget(
              imagePath:
                  'assets/aymen.jpg', // Replace with your actual asset path
              name: 'Aymen Mahmoud',
              role: 'Founder',
            ),
            SizedBox(height: 30), // Space between the profiles
            profileWidget(
              imagePath:
                  'assets/ramzi.jpg', // Replace with your actual asset path
              name: 'Ramzi Bouhadjar',
              role: 'App Devoloper',
            ),
          ],
        ),
      ),
    );
  }

  Widget profileWidget(
      {required String imagePath, required String name, required String role}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60, // Radius of the profile image
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(height: 10), // Space between the image and the name
        Text(
          name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        Text(
          role,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  // Helper widget to build an image inside a column
  Widget _buildImageColumn(BuildContext context, String imagePath) {
    return Expanded(
      // Using Expanded to give equal space for each column
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20), // Circular border radius
            child: Image.asset(
              imagePath,
              height: MediaQuery.of(context).size.height *
                  0.2, // Dynamic height based on screen size
              width: MediaQuery.of(context).size.width *
                  0.4, // Dynamic width based on screen size
              fit: BoxFit.cover, // Cover the bounds of the box
            ),
          ),
        ],
      ),
    );
  }
}

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
    );
  }
}
