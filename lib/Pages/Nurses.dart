import 'package:flutter/material.dart';
import 'package:hopitalyasser/MedicalDataBase.dart';
import 'package:hopitalyasser/addPatient.dart';
import 'package:provider/provider.dart';

class Nurses extends StatefulWidget {
  const Nurses({super.key});

  @override
  State<Nurses> createState() => _NursesState();
}

class _NursesState extends State<Nurses> {
  @override
  void initState() {
    super.initState();
    readData();
  }

  // Read Patients
  void readData() async {
    await context.read<MedicalDatabase>().fetchData();
  }

  final List AvailableChoice = ['Available', 'Not Available'];

  final List<String> masafa1 = ['250M', '420M', '600M', '780M', '890M'];

  final List<String> masafa2 = ['320M', '450M', '670M', '820M', '950M'];

  final List<String> masafa3 = ['150M', '300M', '520M', '740M', '990M'];

  final List<String> masafa4 = ['110M', '460M', '580M', '810M', '900M'];

  final List<String> masafa5 = ['200M', '390M', '620M', '860M', '970M'];

  final List<String> masafa6 = ['180M', '290M', '530M', '710M', '930M'];

  List<String> chooseList() {
    switch (widget.data) {
      case 'Medical services':
        return masafa1;
      case 'Nursing services':
        return masafa2;
      case 'Services for the elderly':
        return masafa3;
      case 'Laboratory testing services':
        return masafa4;
      case 'Babysitting services':
        return masafa5;
      case 'Physiotherapy service':
        return masafa5;
      default:
        return []; // return an empty list or handle as needed
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.grey.shade800,
      content: Text(message),
      duration: Duration(seconds: 3), // Customize duration as needed
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final NurseDB = context.watch<MedicalDatabase>();

    final currentNurse = NurseDB.currentNurse;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 253, 240, 213).withOpacity(0.1),
        title: Text(
          'NURSES',
          style: TextStyle(letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(right: 10, left: 10, top: 15),
          itemCount: currentNurse.length,
          itemBuilder: (context, index) {
            final nurse = currentNurse[index];
            bool isAvailable = nurse.isAvailable;
            List<String> displayedList = chooseList();
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Color.fromARGB(255, 249, 249, 249),
              child: ListTile(
                onTap: () {
                  if (nurse.isAvailable == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => addPatient(data: nurse.name)),
                    );
                  } else {
                    _showSnackBar(context, 'The Nurse is Not Available ');
                  }
                },
                contentPadding: EdgeInsets.all(15),
                title: RichText(
                    text: TextSpan(
                        text:
                            '${nurse.name} • ${nurse.YearsofExperience} Y.O.E\n',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 18,
                          height: 1.5,
                        ),
                        children: [
                      TextSpan(
                        text: 'Speciality: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text: '${nurse.Speciality}\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text: 'Location: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text: '${nurse.Location}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          height: 1.5,
                        ),
                      ),
                    ])),
                trailing: Column(
                  children: [
                    Expanded(
                      flex: 10,
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: isAvailable
                                ? Color.fromARGB(255, 53, 172, 122)
                                    .withOpacity(0.1)
                                : Color.fromARGB(255, 247, 38, 52)
                                    .withOpacity(0.1),
                          ),
                          child: Text(
                            isAvailable
                                ? AvailableChoice[0]
                                : AvailableChoice[1],
                            style: TextStyle(
                                color: isAvailable
                                    ? Color.fromARGB(255, 53, 172, 122)
                                    : Color.fromARGB(255, 247, 38, 52),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                    ),
                    Spacer(),
                    Expanded(
                        flex: 5,
                        child: Text(
                          displayedList[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
