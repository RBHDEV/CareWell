import 'package:flutter/material.dart';
import 'package:hopitalyasser/MedicalDataBase.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Reservation extends StatefulWidget {
  const Reservation({super.key});

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  @override
  void initState() {
    super.initState();
    readData();
  }

  // Read Patients
  void readData() async {
    await context.read<MedicalDatabase>().fetchData();
  }

  final List HospitalizedChoice = ['Pending', 'Completed'];

  @override
  Widget build(BuildContext context) {
    final patientDB = context.watch<MedicalDatabase>();

    final currentPatient = patientDB.currentMedical;

    final filteredPatients = currentPatient
        .where((patient) => patient.name.toLowerCase() == 'ramzi bouhadjar')
        .toList();
    ;

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 229, 229, 229),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 253, 240, 213).withOpacity(0.1),
          title: Text(
            'RESERVATIONS',
            style: TextStyle(letterSpacing: 1),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            padding: EdgeInsets.only(right: 10, left: 10, top: 15),
            itemCount: filteredPatients.length,
            itemBuilder: (context, index) {
              final patient = filteredPatients[index];
              String checkCompletionStatus() {
                if (DateTime.now().isAfter(patient.dateofbook)) {
                  return "Completed";
                } else {
                  return "Pending";
                }
              }

              bool isHospitalizedbool() {
                // Now calling the function correctly
                return checkCompletionStatus() == 'Completed';
              }

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
                          text: 'Date: ',
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
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: isHospitalizedbool()
                            ? Color.fromARGB(255, 53, 172, 122).withOpacity(0.1)
                            : Color.fromARGB(255, 247, 132, 38)
                                .withOpacity(0.1),
                      ),
                      child: Text(
                        checkCompletionStatus(),
                        style: TextStyle(
                            color: isHospitalizedbool()
                                ? Color.fromARGB(255, 53, 172, 122)
                                : Color.fromARGB(255, 247, 132, 38),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )),
                ),
              );
            }));
  }
}
