import 'package:flutter/material.dart';
import 'package:hopitalyasser/Pages/Nurses.dart';

class SpecialityPage extends StatefulWidget {
  const SpecialityPage({super.key});

  @override
  State<SpecialityPage> createState() => _SpecialityPageState();
}

class _SpecialityPageState extends State<SpecialityPage> {
  final List<String> specialities = [
    'Medical services',
    'Nursing services',
    'Services for the elderly',
    'Laboratory testing services',
    'Babysitting services',
    'Physiotherapy service'
  ];
  final List<String> images = [
    'Medical_services.jpg', // Updated image names
    'Nursing_services.jpg',
    'Services_for_the_elderly.jpg',
    'Laboratory_testing_services.jpg',
    'Babysitting_services.jpg',
    'Physiotherapy_service.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(
          255, 229, 229, 229), // Use material design colors for simplicity
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 253, 240, 213).withOpacity(0.1),
        title: Text(
          'NURSES',
          style: TextStyle(letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 15),
          itemCount: specialities.length,
          itemBuilder: (context, index) {
            return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromARGB(
                    255, 249, 249, 249), // Prefer named color for consistency
                elevation: 3,
                child: ListTile(
                  contentPadding:
                      EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 0),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Nurses(data: specialities[index])));
                    print(
                        "________This is the data you're sending = ${specialities[index]}");
                  },
                  title: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          child: Image.asset(
                            'assets/${images[index]}',
                            height: 100,
                            width: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons
                                  .error); // Shows an error icon if the image fails to load
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 3,
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            text: '${specialities[index]}\n',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 20,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }),
    );
  }
}
