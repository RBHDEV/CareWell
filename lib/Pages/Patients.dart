import 'package:flutter/material.dart';
import 'package:hopitalyasser/MedicalDataBase.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Patients extends StatefulWidget {
  const Patients({super.key});

  @override
  State<Patients> createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  @override
  void initState() {
    super.initState();
    readData();
  }

  // Read Patients
  void readData() async {
    await context.read<MedicalDatabase>().fetchData();
  }

  final List HospitalizedChoice = ['Nursed', 'Pending'];

  @override
  Widget build(BuildContext context) {
    final patientDB = context.watch<MedicalDatabase>();

    final currentPatient = patientDB.currentMedical;

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 229, 229, 229),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 253, 240, 213).withOpacity(0.1),
          title: Text(
            'PATIENTS',
            style: TextStyle(letterSpacing: 1),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            padding: EdgeInsets.only(right: 10, left: 10, top: 15),
            itemCount: currentPatient.length,
            itemBuilder: (context, index) {
              final patient = currentPatient[index];
              final isHospitalized = patient.isHopitalized;
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color.fromARGB(255, 249, 249, 249),
                elevation: 3,
                child: ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.all(15),
                  title: RichText(
                      text: TextSpan(
                          text: '${patient.name} • ${patient.age} yo\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 18,
                            height: 1.5,
                          ),
                          children: [
                        TextSpan(
                          text: 'Disease: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                        TextSpan(
                          text: '${patient.disease}\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                        TextSpan(
                          text: 'Booking Date: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                        TextSpan(
                          text:
                              '${DateFormat.yMMMEd().format(patient.dateofbook).toString()}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                      ])),
                  trailing: TextButton(
                      onPressed: () {
                        patient.isHopitalized = !patient.isHopitalized;
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: isHospitalized
                            ? Color.fromARGB(255, 53, 172, 122).withOpacity(0.1)
                            : Color.fromARGB(255, 247, 38, 52).withOpacity(0.1),
                      ),
                      child: Text(
                        isHospitalized
                            ? HospitalizedChoice[0]
                            : HospitalizedChoice[1],
                        style: TextStyle(
                            color: isHospitalized
                                ? Color.fromARGB(255, 53, 172, 122)
                                : Color.fromARGB(255, 247, 38, 52),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                ),
              );
            }));
  }
}
