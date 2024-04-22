import 'package:flutter/cupertino.dart';
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
  late TextEditingController periodController;
  late TextEditingController nursingToolsController;
  late TextEditingController chroiIlnessController;

  bool isEdited = false;

  String? character = 'Unconscious';
  String? chroiIlness = 'allergique';

  @override
  void initState() {
    super.initState();
    nurseUserChoosed = TextEditingController(text: widget.data);
    datetimeController = TextEditingController();
    dateOfBookingController = TextEditingController();
    nameController = TextEditingController();
    ageController = TextEditingController();
    diseaseController = TextEditingController();
    periodController = TextEditingController();
    nursingToolsController = TextEditingController();
  }

  @override
  void dispose() {
    nurseUserChoosed.dispose();
    datetimeController.dispose();
    dateOfBookingController.dispose();
    nameController.dispose();
    ageController.dispose();
    diseaseController.dispose();
    periodController.dispose();
    nursingToolsController.dispose();
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

  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String? period;

  int timeOfDayToMinutes(TimeOfDay time) {
    return time.hour * 60 + time.minute;
  }

  Future<void> _selectTime(BuildContext context,
      {required bool isStart}) async {
    final TimeOfDay initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: (isStart ? startTime : endTime) ?? initialTime,
    );

    if (newTime != null) {
      setState(() {
        if (isStart) {
          startTime = newTime;
        } else if (startTime != null &&
            timeOfDayToMinutes(newTime) >= timeOfDayToMinutes(startTime!)) {
          endTime = newTime;
          calculateDuration();
        } else {
          showErrorDialog(context);
        }
      });
    }
  }

  void calculateDuration() {
    if (startTime != null && endTime != null) {
      int startMinutes = timeOfDayToMinutes(startTime!);
      int endMinutes = timeOfDayToMinutes(endTime!);
      int durationMinutes = endMinutes - startMinutes;

      int hours = durationMinutes ~/ 60;
      int minutes = durationMinutes % 60;
      if (hours == 0) {
        period = '${minutes}m';
      } else {
        period = '${hours}h ${minutes}m';
      }
    }
  }

  void showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Invalid Time"),
        content: Text("End time must be after start time."),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    );
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
                            border: OutlineInputBorder(
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
                            border: OutlineInputBorder(
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
                      border: OutlineInputBorder(
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
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        controller: dateOfBookingController,
                        onTap: _showDatePicker,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.calendar_month),
                          label: Text('Date'),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
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
                    ),

                    ///

                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill the informations';
                          }
                          return null;
                        },
                        onTap: () async {
                          await _selectTime(context, isStart: true);
                          await _selectTime(context, isStart: false);
                          setState(() {
                            periodController =
                                TextEditingController(text: period);
                          });
                        },
                        controller: periodController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.timelapse),
                            label: Text('Period'),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple.shade200,
                                    width: 3),
                                borderRadius: BorderRadius.circular(15)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10))),
                        readOnly: true,
                      ),
                    ),
                  ],
                ),

                ////
                SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(
                            'character : ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          )),
                      Expanded(
                        flex: 4,
                        child: DropdownButton<String>(
                          value: character,
                          onChanged: (String? value) {
                            setState(() {
                              character = value!;
                            });
                          },
                          items: [
                            DropdownMenuItem<String>(
                                value: 'Unconscious',
                                child: Text('Unconscious')),
                            DropdownMenuItem<String>(
                                value: 'Bedridden', child: Text('Bedridden')),
                            DropdownMenuItem<String>(
                                value: 'Disabled', child: Text('Disabled')),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                ////

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text(
                            'Chronic illness : ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Expanded(
                        flex: 4,
                        child: DropdownButton<String>(
                          value: chroiIlness,
                          onChanged: (String? value2) {
                            setState(() {
                              chroiIlness = value2!;
                            });
                          },
                          items: [
                            DropdownMenuItem<String>(
                                value: 'allergique', child: Text('allergique')),
                            DropdownMenuItem<String>(
                                value: 'diabétiques',
                                child: Text('diabétiques')),
                            DropdownMenuItem<String>(
                                value: 'hypertension',
                                child: Text('hypertension')),
                          ],
                        ),
                      )
                    ],
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

class TimeInputField extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final String? value;

  TimeInputField({required this.label, required this.onTap, this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            suffixIcon: Icon(Icons.access_time),
          ),
          controller: TextEditingController(text: value),
          onTap: onTap,
        ),
      ),
    );
  }
}
