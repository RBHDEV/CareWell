import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hopitalyasser/MedicalDataBase.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  //
  TextEditingController nurseName = TextEditingController();
  TextEditingController nurseSpeciality = TextEditingController();
  TextEditingController nurseYOE = TextEditingController();
  TextEditingController nurseLocation = TextEditingController();

  // Read Patients
  void readData() async {
    await context.read<MedicalDatabase>().fetchData();
  }

  //
  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  void dispose() {
    nurseName.dispose();
    nurseSpeciality.dispose();
    nurseYOE.dispose();
    nurseLocation.dispose();
    super.dispose();
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.green,
      content: Text(message),
      duration: Duration(seconds: 3), // Customize duration as needed
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final NurseDB = context.watch<MedicalDatabase>();

    final MyProfile = NurseDB.currentNurse;

    String name = MyProfile[0].name;
    String speciality = MyProfile[0].Speciality;
    String yoe = MyProfile[0].YearsofExperience;
    bool available = MyProfile[0].isAvailable;
    String location = MyProfile[0].Location;

    setState(() {
      nurseName = TextEditingController(text: name);
      nurseSpeciality = TextEditingController(text: speciality);
      nurseYOE = TextEditingController(text: yoe);
      nurseLocation = TextEditingController(text: location);
    });

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 229, 229, 229),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 253, 240, 213).withOpacity(0.1),
          forceMaterialTransparency: true,
          title: Text(
            'BOOK NURSE',
            style: TextStyle(letterSpacing: 1),
          ),
          centerTitle: true,
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(right: 20, left: 20, top: 50),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ////
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please fill the informations';
                              }
                              return null;
                            },
                            controller: nurseName,
                            decoration: InputDecoration(
                              label: Text('Full Name'),
                              filled: true,
                              fillColor: Color.fromARGB(255, 249, 249, 249)
                                  .withOpacity(0.7),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepPurple.shade200,
                                      width: 3),
                                  borderRadius: BorderRadius.circular(15)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please fill the informations';
                              }
                              return null;
                            },
                            controller: nurseYOE,
                            decoration: InputDecoration(
                                label: Text('YOE'),
                                filled: true,
                                fillColor: Color.fromARGB(255, 249, 249, 249)
                                    .withOpacity(0.7),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepPurple.shade200,
                                        width: 3),
                                    borderRadius: BorderRadius.circular(15)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ],
                    ),

                    ////
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please fill the informations';
                        }
                        return null;
                      },
                      controller: nurseSpeciality,
                      decoration: InputDecoration(
                          label: Text('Speciality'),
                          filled: true,
                          fillColor: Color.fromARGB(255, 249, 249, 249)
                              .withOpacity(0.7),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple.shade200, width: 3),
                              borderRadius: BorderRadius.circular(15)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(10))),
                    ),

                    ////
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please fill the informations';
                        }
                        return null;
                      },
                      controller: nurseLocation,
                      decoration: InputDecoration(
                          label: Text('Location'),
                          filled: true,
                          fillColor: Color.fromARGB(255, 249, 249, 249)
                              .withOpacity(0.7),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple.shade200, width: 3),
                              borderRadius: BorderRadius.circular(15)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(10))),
                    ),

                    ////
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ToggleSwitch(
                        minWidth: 110.0,
                        initialLabelIndex: available ? 0 : 1,
                        cornerRadius: 20.0,
                        activeFgColor: const Color.fromRGBO(255, 255, 255, 1),
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: ['Available ', 'Not Available'],
                        activeBgColors: [
                          [Color.fromARGB(255, 53, 172, 122)],
                          [Color.fromARGB(255, 247, 38, 52)]
                        ],
                        onToggle: (index) {
                          available = !available;
                        },
                      ),
                    ),

                    ////
                    SizedBox(
                      height: 50,
                    ),

                    SizedBox(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () async {
                              await context.read<MedicalDatabase>().updateNurse(
                                  1,
                                  nurseName.text,
                                  nurseSpeciality.text,
                                  available,
                                  nurseYOE.text,
                                  nurseLocation.text);
                              _showSnackBar(
                                  context, 'Nurse informations updated');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[400],
                                foregroundColor: Colors.white),
                            child: Text(
                              'Save',
                              style: TextStyle(fontSize: 15),
                            ))),
                  ],
                ),
              ),
            )));
  }
}
