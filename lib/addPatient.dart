import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hopitalyasser/MedicalDataBase.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class addPatient extends StatefulWidget {
  final String data;
  const addPatient({super.key, required this.data});

  @override
  State<addPatient> createState() => _addPatientState();
}

class _addPatientState extends State<addPatient> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nurseUserChoosed;
  late TextEditingController datetimeController;
  late TextEditingController dateOfBookingController;
  //
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController diseaseController;
  bool isEdited = false;

  @override
  void initState() {
    super.initState();
    nurseUserChoosed = TextEditingController(text: widget.data);
    datetimeController = TextEditingController();
    dateOfBookingController = TextEditingController();
    nameController = TextEditingController();
    ageController = TextEditingController();
    diseaseController = TextEditingController();
  }

  @override
  void dispose() {
    nurseUserChoosed.dispose();
    datetimeController.dispose();
    dateOfBookingController.dispose();
    nameController.dispose();
    ageController.dispose();
    diseaseController.dispose();
    super.dispose();
  }

  DateTime _bookDate = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2024),
            lastDate: DateTime(2025))
        .then((value) {
      if (value != null) {
        // Check if the value is not null
        setState(() {
          _bookDate = value;
          datetimeController =
              TextEditingController(text: _bookDate.toString());
          dateOfBookingController = TextEditingController(
              text: DateFormat.yMMMEd().format(_bookDate).toString());
          isEdited = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      appBar: AppBar(
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
                        controller: nameController,
                        decoration: InputDecoration(
                            label: Text('Full Name'),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple.shade200,
                                    width: 3),
                                borderRadius: BorderRadius.circular(15)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10))),
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
                        controller: ageController,
                        decoration: InputDecoration(
                            label: Text('Age'),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple.shade200,
                                    width: 3),
                                borderRadius: BorderRadius.circular(15)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
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
                  controller: diseaseController,
                  decoration: InputDecoration(
                      label: Text('Disease'),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurple.shade200, width: 3),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10))),
                ),

                ////
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill the informations';
                    }
                    return null;
                  },
                  controller: nurseUserChoosed,
                  decoration: InputDecoration(
                      label: Text('Nurse'),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurple.shade200, width: 3),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10))),
                ),

                ////
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: dateOfBookingController,
                  onTap: _showDatePicker,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.calendar_month),
                    label: Text('Date'),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill the informations';
                    }
                    return null;
                  },
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
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, proceed to book.
                            final DateTime dateOfBooking =
                                DateTime.parse(datetimeController.text);
                            await context.read<MedicalDatabase>().addPatient(
                                nameController.text,
                                diseaseController.text,
                                false,
                                ageController.text,
                                dateOfBooking);
                            Navigator.pop(context);
                          } else {
                            // If the form is not valid, show a snackbar.
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text('Please fill all the information')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[400],
                            foregroundColor: Colors.white),
                        child: Text(
                          'Book',
                          style: TextStyle(fontSize: 15),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
