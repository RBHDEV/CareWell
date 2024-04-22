import 'package:flutter/material.dart';
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
                    child: Text("Contact"),
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
        title: Text(
          "Credits",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple[400], // Custom color for the AppBar
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
}

// ignore: must_be_immutable
class ContactsPage extends StatelessWidget {
  void _showSnackBar(Color color, BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message),
      duration: Duration(seconds: 3), // Customize duration as needed
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple[400], // Custom color for the AppBar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _messageController,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Enter your message...',
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_messageController.text.isEmpty) {
                  _showSnackBar(Colors.grey.shade700, context,
                      'Please fill your Message ');
                } else {
                  _showSnackBar(
                      Colors.deepPurple.shade700, context, 'Message Sent! ');
                  Navigator.pop(context);
                }
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
