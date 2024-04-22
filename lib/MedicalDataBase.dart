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

  Future<bool> isitfirstLaunch() async {
    final isitfirstLaunch = await _isFirstLaunch();
    return isitfirstLaunch;
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
    final List<Patients> patientsData = [
      Patients()
        ..id = 1
        ..name = 'Jones Bishop'
        ..disease = 'Acute cholecystitis'
        ..age = '25'
        ..isHopitalized = false
        ..dateofbook = DateTime(2024, 04, 04, 00, 00, 00)
        ..character = 'Normal'
        ..chroIllness = 'Nothing'
        ..nursingTools = 'No'
        ..period = '2D 10H 30M',
      Patients()
        ..id = 2
        ..name = 'Thea Griffith'
        ..disease = 'Allergic rhinitis'
        ..age = '38'
        ..isHopitalized = true
        ..dateofbook = DateTime(2024, 05, 07, 00, 00, 00)
        ..character = 'Disabled'
        ..chroIllness = 'allergique'
        ..nursingTools = 'Yes'
        ..period = '4D 12H 00M',
      Patients()
        ..id = 3
        ..name = 'Daniel Contreras'
        ..disease = 'Bone cancer'
        ..age = '50'
        ..isHopitalized = false
        ..dateofbook = DateTime(2024, 06, 03, 00, 00, 00)
        ..character = 'Bedridden patient'
        ..chroIllness = 'Nothing'
        ..nursingTools = 'Yes'
        ..period = '6D 8H 15M',
      Patients()
        ..id = 4
        ..name = 'Miley Russell'
        ..disease = 'Chlamydia'
        ..age = '20'
        ..isHopitalized = true
        ..dateofbook = DateTime(2024, 07, 15, 00, 00, 00)
        ..character = 'Normal'
        ..chroIllness = 'Nothing'
        ..nursingTools = 'No'
        ..period = '1D 4H 20M',
      Patients()
        ..id = 5
        ..name = 'Itzel Rich'
        ..disease = 'Depression'
        ..age = '14'
        ..isHopitalized = false
        ..dateofbook = DateTime(2024, 07, 23, 00, 00, 00)
        ..character = 'Disabled'
        ..chroIllness = 'Nothing'
        ..nursingTools = 'No'
        ..period = '0D 3H 50M',
      Patients()
        ..id = 6
        ..name = 'Sarah Lee'
        ..disease = 'Flu'
        ..age = '32'
        ..isHopitalized = true
        ..dateofbook = DateTime(2024, 04, 29, 00, 00, 00)
        ..character = 'Unconscious'
        ..chroIllness = 'hypertension'
        ..nursingTools = 'Yes'
        ..period = '3D 7H 30M',
      Patients()
        ..id = 7
        ..name = 'Alex Miller'
        ..disease = 'Sprained ankle'
        ..age = '18'
        ..isHopitalized = false
        ..dateofbook = DateTime(2024, 11, 01, 00, 00, 00)
        ..character = 'Normal'
        ..chroIllness = 'Nothing'
        ..nursingTools = 'No'
        ..period = '0D 2H 10M',
      Patients()
        ..id = 8
        ..name = 'Olivia Garcia'
        ..disease = 'Diabetes'
        ..age = '65'
        ..isHopitalized = true
        ..dateofbook = DateTime(2024, 10, 14, 00, 00, 00)
        ..character = 'Disabled'
        ..chroIllness = 'diabétiques'
        ..nursingTools = 'Yes'
        ..period = '5D 13H 45M',
      Patients()
        ..id = 9
        ..name = 'Noah Hernandez'
        ..disease = 'Food poisoning'
        ..age = '7'
        ..isHopitalized = false
        ..dateofbook = DateTime(2024, 11, 17, 00, 00, 00)
        ..character = 'Normal'
        ..chroIllness = 'Nothing'
        ..nursingTools = 'No'
        ..period = '0D 1H 20M',
      Patients()
        ..id = 10
        ..name = 'Sophia Parker'
        ..disease = 'Headache'
        ..age = '42'
        ..isHopitalized = false
        ..dateofbook = DateTime(2024, 12, 04, 00, 00, 00)
        ..character = 'Normal'
        ..chroIllness = 'Nothing'
        ..nursingTools = 'No'
        ..period = '0D 0H 45M',
    ];

    final List<Nurse> nursedata = [
      Nurse()
        ..id = 1
        ..name = 'Aymen Mahmoud'
        ..Speciality = 'Medical services'
        ..isAvailable = true
        ..YearsofExperience = '7'
        ..Location = 'next to the Nasser Pharmacy - Alger',
      Nurse()
        ..id = 2
        ..name = 'Emily White'
        ..Speciality = 'Nursing services'
        ..isAvailable = false
        ..YearsofExperience = '5'
        ..Location = 'Central Hospital - New York',
      Nurse()
        ..id = 3
        ..name = 'Alex Green'
        ..Speciality = 'Services for the elderly'
        ..isAvailable = true
        ..YearsofExperience = '10'
        ..Location = 'Healthcare Clinic - London',
      Nurse()
        ..id = 4
        ..name = 'Sarah Lee'
        ..Speciality = 'Laboratory testing services'
        ..isAvailable = true
        ..YearsofExperience = '8'
        ..Location = 'Community Health Center - Sydney',
      Nurse()
        ..id = 5
        ..name = 'James Park'
        ..Speciality = 'Babysitting services'
        ..isAvailable = false
        ..YearsofExperience = '6'
        ..Location = 'Cancer Research Institute - Seoul',
      Nurse()
        ..id = 6
        ..name = 'Laura Smith'
        ..Speciality = 'Physiotherapy service'
        ..isAvailable = true
        ..YearsofExperience = '9'
        ..Location = 'Women’s Health Center - Toronto',
      Nurse()
        ..id = 7
        ..name = 'John Doe'
        ..Speciality = 'Medical services'
        ..isAvailable = true
        ..YearsofExperience = '4'
        ..Location = 'Nursing services',
      Nurse()
        ..id = 8
        ..name = 'Sophia Johnson'
        ..Speciality = 'Services for the elderly'
        ..isAvailable = false
        ..YearsofExperience = '7'
        ..Location = 'Emergency Hospital - Mumbai',
      Nurse()
        ..id = 9
        ..name = 'Michael Brown'
        ..Speciality = 'Laboratory testing services'
        ..isAvailable = true
        ..YearsofExperience = '11'
        ..Location = 'University Medical Center - Berlin',
      Nurse()
        ..id = 10
        ..name = 'Linda Garcia'
        ..Speciality = 'Babysitting services'
        ..isAvailable = true
        ..YearsofExperience = '5'
        ..Location = 'Orthopedic Hospital - Madrid',
      Nurse()
        ..id = 11
        ..name = 'Laura Smith'
        ..Speciality = 'Physiotherapy service'
        ..isAvailable = false
        ..YearsofExperience = '5'
        ..Location = 'Central Hospital - Cairo',
      Nurse()
        ..id = 12
        ..name = 'Juan Perez'
        ..Speciality = 'Medical services'
        ..isAvailable = true
        ..YearsofExperience = '8'
        ..Location = 'Saint Mary Clinic - Madrid',
      Nurse()
        ..id = 13
        ..name = 'Susan Johnson'
        ..Speciality = 'Nursing services'
        ..isAvailable = false
        ..YearsofExperience = '9'
        ..Location = 'Healing Hands Center - New York',
      Nurse()
        ..id = 14
        ..name = 'Hassan Elmaghraby'
        ..Speciality = 'Services for the elderly'
        ..isAvailable = true
        ..YearsofExperience = '3'
        ..Location = 'Sunrise Seniors Home - Alexandria',
      Nurse()
        ..id = 15
        ..name = 'Emily Zhang'
        ..Speciality = 'Laboratory testing services'
        ..isAvailable = true
        ..YearsofExperience = '6'
        ..Location = 'Health Bridge Hospital - Beijing',
      Nurse()
        ..id = 16
        ..name = 'Mohamed Ali'
        ..Speciality = 'Babysitting services'
        ..isAvailable = false
        ..YearsofExperience = '11'
        ..Location = 'Heart Care Institute - Casablanca',
      Nurse()
        ..id = 17
        ..name = 'Sarah Connor'
        ..Speciality = 'Physiotherapy service'
        ..isAvailable = true
        ..YearsofExperience = '4'
        ..Location = 'Bone & Joint Center - Los Angeles',
      Nurse()
        ..id = 18
        ..name = 'John Doe'
        ..Speciality = 'Medical services'
        ..isAvailable = false
        ..YearsofExperience = '10'
        ..Location = 'Brain Health Clinic - London',
      Nurse()
        ..id = 19
        ..name = 'Patricia Kali'
        ..Speciality = 'Nursing services'
        ..isAvailable = true
        ..YearsofExperience = '5'
        ..Location = 'Skin Care Specialists - Sydney',
      Nurse()
        ..id = 20
        ..name = 'Rajesh Singh'
        ..Speciality = 'Services for the elderly'
        ..isAvailable = true
        ..YearsofExperience = '6'
        ..Location = 'Digestive Health Services - Mumbai',
      Nurse()
        ..id = 21
        ..name = 'Lisa Wong'
        ..Speciality = 'Laboratory testing services'
        ..isAvailable = false
        ..YearsofExperience = '7'
        ..Location = 'Children’s Medical Center - Hong Kong',
      Nurse()
        ..id = 22
        ..name = 'Omar Farooq'
        ..Speciality = 'Babysitting services'
        ..isAvailable = true
        ..YearsofExperience = '5'
        ..Location = 'Community Health Center - Dubai',
      Nurse()
        ..id = 23
        ..name = 'Anna Ivanova'
        ..Speciality = 'Physiotherapy service'
        ..isAvailable = false
        ..YearsofExperience = '9'
        ..Location = 'Emergency Hospital - Moscow',
      Nurse()
        ..id = 24
        ..name = 'Carlos Rodriguez'
        ..Speciality = 'Medical services'
        ..isAvailable = true
        ..YearsofExperience = '12'
        ..Location = 'General Surgery Dept - Buenos Aires',
      Nurse()
        ..id = 25
        ..name = 'Grace Lim'
        ..Speciality = 'Nursing services'
        ..isAvailable = false
        ..YearsofExperience = '4'
        ..Location = 'Elderly Care Facility - Singapore',
    ];

    await isar.writeTxn(() async {
      await isar.patients.putAll(patientsData);
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
      String characterFromUser,
      String chroiIlnessFromUser,
      String periodFromUser,
      String nursingToolsFromUser,
      DateTime dateofbookFromUser) async {
    final newPatient = Patients()
      ..name = nameFromUser
      ..disease = diseaseFromUser
      ..isHopitalized = isHopitalizedFromUser
      ..age = ageFromUser
      ..character = characterFromUser
      ..chroIllness = chroiIlnessFromUser
      ..period = periodFromUser
      ..nursingTools = nursingToolsFromUser
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
      print('____________Error fetching data from Isar DB: $e');
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
      String characterFromUser,
      String chroiIlnessFromUser,
      String periodFromUser,
      String nursingToolsFromUser,
      DateTime dateofbookFromUser) async {
    final existingPatient = await isar.patients.get(id);

    if (existingPatient != null) {
      existingPatient.name = nameFromUser;
      existingPatient.disease = diseaseFromUser;
      existingPatient.isHopitalized = isHopitalizedFromUser;
      existingPatient.age = ageFromUser;
      existingPatient.character = characterFromUser;
      existingPatient.chroIllness = chroiIlnessFromUser;
      existingPatient.period = periodFromUser;
      existingPatient.nursingTools = nursingToolsFromUser;
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
