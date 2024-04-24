import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:hopitalyasser/LoginPage.dart';

class PageOFRules extends StatefulWidget {
  const PageOFRules({
    super.key,
  });

  @override
  State<PageOFRules> createState() => _PageOFRulesState();
}

class _PageOFRulesState extends State<PageOFRules> {
  String termsAndConditions = '''
Here is a list of laws and regulations that customers must agree to when logging into the app to address the issues mentioned above:

1. Privacy Policy: Customers must agree to the app's privacy policy, which sets out how their personal information is collected, used and protected. This helps address the issue of patient privacy.

2. Code of Conduct: Customers must adhere to the Code of Conduct which sets expectations for respectful and appropriate behavior when using the application. This can help prevent problems such as inappropriate professional behavior.

3. Compliance with Laws: Customers must comply with all applicable laws and regulations relating to healthcare and data privacy. This helps ensure that all parties act within legal boundaries.

4. Consent to Treatment: Customers must give explicit consent to any treatment or service they receive through the Application. This helps reduce liability risks and legal issues related to professional liability.

5. Data Protection Agreement: Customers must agree to a data protection agreement that defines how their health information is securely stored, accessed and shared. This helps address data security and privacy concerns.

By requiring customers to agree to these laws and regulations when logging into the app, it can help protect the company's interests and ensure that all parties are aware of their rights and responsibilities.
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms And Conditions"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('$termsAndConditions'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text('Refuse'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('Accept'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
