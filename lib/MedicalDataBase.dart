import 'package:hopitalyasser/Models/Nurse.dart';
import 'package:hopitalyasser/Models/Patients.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicalDatabase extends ChangeNotifier {
  static late Isar isar;

  // INITIALIZE THE DATABASE
  static Future<void> initialize() async {
    final dir =
        await getApplicationDocumentsDirectory(); // Changed to Application Documents Directory
    isar = await Isar.open([PatientsSchema, NurseSchema], directory: dir.path);

    // Load initial data on first launch
    final isFirstLaunch = await _isFirstLaunch();
    if (isFirstLaunch) {
      await _insertSampleData();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('medicalAppLaunched', true); // Marking first launch
    }
  }

  // Function to check for first launch (optional)
  static Future<bool> _isFirstLaunch() async {
    // Implement your preferred logic to determine first launch
    // (e.g., SharedPreferences, local file existence)
    final prefs = await SharedPreferences.getInstance();
    return !prefs.containsKey('medicalAppLaunched');
  }

  // Function to insert sample data
  static Future<void> _insertSampleData() async {
    final List<Patients> patientsdata = [
      Patients()
        ..id = 1
        ..name = 'Jones Bishop'
        ..disease = 'Acute cholecystitis'
        ..age = '25'
        ..isHopitalized = false
        ..dateofbook = DateTime(2024, 04, 04, 00, 00, 00),
      Patients()
        ..id = 2
        ..name = 'Thea Griffith'
        ..disease = 'Allergic rhinitis'
        ..age = '38'
        ..isHopitalized = true
        ..dateofbook = DateTime(2024, 05, 07, 00, 00, 00),
      Patients()
        ..id = 3
        ..name = 'Daniel Contreras'
        ..disease = 'Bone cancer'
        ..age = '50'
        ..isHopitalized = false
        ..dateofbook = DateTime(2024, 06, 03, 00, 00, 00),
      Patients()
        ..id = 4
        ..name = 'Miley Russell'
        ..disease = 'Chlamydia'
        ..age = '20'
        ..isHopitalized = true
        ..dateofbook = DateTime(2024, 07, 15, 00, 00, 00),
      Patients()
        ..id = 5
        ..name = 'Itzel Rich'
        ..disease = 'Depression'
        ..age = '14'
        ..isHopitalized = false
        ..dateofbook = DateTime(2024, 07, 23, 00, 00, 00),
      Patients()
        ..id = 6
        ..name = 'Sarah Lee'
        ..disease = 'Flu'
        ..age = '32'
        ..isHopitalized = true
        ..dateofbook = DateTime(2024, 04, 29, 00, 00, 00),
      Patients()
        ..id = 7
        ..name = 'Alex Miller'
        ..disease = 'Sprained ankle'
        ..age = '18'
        ..isHopitalized = false
        ..dateofbook = DateTime(2024, 11, 01, 00, 00, 00),
      Patients()
        ..id = 8
        ..name = 'Olivia Garcia'
        ..disease = 'Diabetes'
        ..age = '65'
        ..isHopitalized = true
        ..dateofbook = DateTime(2024, 10, 14, 00, 00, 00),
      Patients()
        ..id = 9
        ..name = 'Noah Hernandez'
        ..disease = 'Food poisoning'
        ..age = '7'
        ..isHopitalized = false
        ..dateofbook = DateTime(2024, 11, 17, 00, 00, 00),
      Patients()
        ..id = 10
        ..name = 'Sophia Parker'
        ..disease = 'Headache'
        ..age = '42'
        ..isHopitalized = false
        ..dateofbook = DateTime(2024, 12, 04, 00, 00, 00),
    ];

    final List<Nurse> nursedata = [
      Nurse()
        ..id = 1
        ..name = 'Aymen Mahmoud'
        ..Speciality = 'Psychiatric nurse'
        ..isAvailable = true
        ..YearsofExperience = '7'
        ..Location = 'next to the Nasser Pharmacy - Alger',
      Nurse()
        ..id = 2
        ..name = 'Emily White'
        ..Speciality = 'Critical Care Nurse'
        ..isAvailable = false
        ..YearsofExperience = '5'
        ..Location = 'Central Hospital - New York',
      Nurse()
        ..id = 3
        ..name = 'Alex Green'
        ..Speciality = 'Certified Registered Anesthetist'
        ..isAvailable = true
        ..YearsofExperience = '10'
        ..Location = 'Healthcare Clinic - London',
      Nurse()
        ..id = 4
        ..name = 'Sarah Lee'
        ..Speciality = 'Family Nurse Practitioner'
        ..isAvailable = true
        ..YearsofExperience = '8'
        ..Location = 'Community Health Center - Sydney',
      Nurse()
        ..id = 5
        ..name = 'James Park'
        ..Speciality = 'Oncology Nurse'
        ..isAvailable = false
        ..YearsofExperience = '6'
        ..Location = 'Cancer Research Institute - Seoul',
      Nurse()
        ..id = 6
        ..name = 'Laura Smith'
        ..Speciality = 'Nurse Midwife'
        ..isAvailable = true
        ..YearsofExperience = '9'
        ..Location = 'Women’s Health Center - Toronto',
      Nurse()
        ..id = 7
        ..name = 'John Doe'
        ..Speciality = 'Pediatric Nurse Practitioner'
        ..isAvailable = true
        ..YearsofExperience = '4'
        ..Location = 'Pediatric Clinic - Los Angeles',
      Nurse()
        ..id = 8
        ..name = 'Sophia Johnson'
        ..Speciality = 'Emergency Room Nurse'
        ..isAvailable = false
        ..YearsofExperience = '7'
        ..Location = 'Emergency Hospital - Mumbai',
      Nurse()
        ..id = 9
        ..name = 'Michael Brown'
        ..Speciality = 'Clinical Nurse Specialist'
        ..isAvailable = true
        ..YearsofExperience = '11'
        ..Location = 'University Medical Center - Berlin',
      Nurse()
        ..id = 10
        ..name = 'Linda Garcia'
        ..Speciality = 'Orthopedic Nurse'
        ..isAvailable = true
        ..YearsofExperience = '5'
        ..Location = 'Orthopedic Hospital - Madrid',
    ];

    await isar.writeTxn(() async {
      await isar.patients.putAll(patientsdata);
      await isar.nurses.putAll(nursedata);
    });
  }

  // a list of medical
  final List<Patients> currentMedical = [];

  final List<Nurse> currentNurse = [];

  // CREATE A NEW PATIENT
  Future<void> addPatient(
      String nameFromUser,
      String diseaseFromUser,
      bool isHopitalizedFromUser,
      String ageFromUser,
      DateTime dateofbookFromUser) async {
    final newPatient = Patients()
      ..name = nameFromUser
      ..disease = diseaseFromUser
      ..isHopitalized = isHopitalizedFromUser
      ..age = ageFromUser
      ..dateofbook = dateofbookFromUser;

    await isar.writeTxn(() => isar.patients.put(newPatient));

    fetchData();
  }

  // READ PATIENTS FROM DB
  Future<void> fetchData() async {
    try {
      List<Patients> fetchPatient = await isar.patients.where().findAll();
      List<Nurse> fetchNurse = await isar.nurses.where().findAll();

      currentMedical.clear();
      currentNurse.clear();

      currentMedical.addAll(fetchPatient);
      currentNurse.addAll(fetchNurse);

      notifyListeners();
    } catch (e) {
      print('Error fetching data from Isar DB: $e');
      // Handle or log the error as needed
    }
  }

  // UPDATE A PATIENT IN THE DB
  Future<void> updatePatient(
      int id,
      String nameFromUser,
      String diseaseFromUser,
      bool isHopitalizedFromUser,
      String ageFromUser,
      DateTime dateofbookFromUser) async {
    final existingPatient = await isar.patients.get(id);

    if (existingPatient != null) {
      existingPatient.name = nameFromUser;
      existingPatient.disease = diseaseFromUser;
      existingPatient.isHopitalized = isHopitalizedFromUser;
      existingPatient.age = ageFromUser;
      existingPatient.dateofbook = dateofbookFromUser;

      await isar.writeTxn(() => isar.patients.put(existingPatient));
      await fetchData();
    }
  }

  // UPDATE A Nurse IN THE DB
  Future<void> updateNurse(
      int id,
      String nameFromUser,
      String specialityFromUser,
      bool isAvailableFromUser,
      String yoeFromUser,
      String locationFromUser) async {
    final existingNurse = await isar.nurses.get(id);

    if (existingNurse != null) {
      existingNurse.name = nameFromUser;
      existingNurse.Speciality = specialityFromUser;
      existingNurse.isAvailable = isAvailableFromUser;
      existingNurse.YearsofExperience = yoeFromUser;
      existingNurse.Location = locationFromUser;

      await isar.writeTxn(() => isar.nurses.put(existingNurse));
      await fetchData();
    }
  }

  // DELETE A PATIENT FROM THE DB
  Future<void> deletePatient(int id) async {
    await isar.writeTxn(() => isar.patients.delete(id));
    await fetchData();
  }
}
