import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopitalyasser/Lists/PatientList.dart';

class Patients extends StatefulWidget {
  const Patients({super.key});

  @override
  State<Patients> createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  final List<APatient> thePatientList = [
    APatient(
        name: 'Jones Bishop',
        disease: 'Acute cholecystitis',
        age: 25,
        ishospitalized: false),
    APatient(
        name: 'Thea Griffith',
        disease: 'Allergic rhinitis',
        age: 38,
        ishospitalized: true),
    APatient(
        name: 'Daniel Contreras',
        disease: 'Bone cancer',
        age: 50,
        ishospitalized: false),
    APatient(
        name: 'Miley Russell',
        disease: 'Chlamydia',
        age: 20,
        ishospitalized: true),
    APatient(
        name: 'Itzel Rich',
        disease: 'Depression',
        age: 14,
        ishospitalized: false),
    APatient(
      name: 'Sarah Lee',
      disease: 'Flu',
      age: 32,
      ishospitalized: true,
    ),
    APatient(
      name: 'Alex Miller',
      disease: 'Sprained ankle',
      age: 18,
      ishospitalized: false,
    ),
    APatient(
      name: 'Olivia Garcia',
      disease: 'Diabetes',
      age: 65,
      ishospitalized: true,
    ),
    APatient(
      name: 'Noah Hernandez',
      disease: 'Food poisoning',
      age: 7,
      ishospitalized: false,
    ),
    APatient(
      name: 'Sophia Parker',
      disease: 'Headache',
      age: 42,
      ishospitalized: false,
    ),
  ];

  final List ishospitalized = ['Hospitalized', 'Not Hospitalized'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 229, 229, 229),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 253, 240, 213).withOpacity(0.1),
          title: Text(
            'PATIENTS',
            style: TextStyle(letterSpacing: 1),
          ),
          centerTitle: true,
        ),
        body: Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(right: 10, left: 10, top: 15),
                itemCount: thePatientList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Color.fromARGB(255, 249, 249, 249),
                    child: ListTile(
                      onTap: () {},
                      contentPadding: EdgeInsets.all(15),
                      title: RichText(
                          text: TextSpan(
                              text:
                                  '${thePatientList[index].name} • ${thePatientList[index].age} yo\n',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 15,
                                height: 1.5,
                              ),
                              children: [
                            TextSpan(
                              text: 'Disease: ${thePatientList[index].disease}',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                height: 1.5,
                              ),
                            ),
                          ])),
                      trailing: TextButton(
                          onPressed: () {}, child: Text(ishospitalized[1])),
                    ),
                  );
                })));
  }
}
