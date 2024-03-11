import 'package:hopitalyasser/Models/Medical.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class MedicalDatabase extends ChangeNotifier {
  static late Isar isar;

  // INITIALIZE THE DATABASE
  static Future<void> initialize() async {
    final dir = await getApplicationCacheDirectory();
    isar = await Isar.open([MedicalSchema], directory: dir.path);
  }

  // a list of medical
  final List<Medical> currentMedical = [];

  // CREATE A NEW PATIENT
  Future<void> addPatient(String nameFromUser, String diseaseFromUser,
      bool isHopitalized, int age) async {
    final newPatient = Medical()
      ..name = nameFromUser
      ..disease = diseaseFromUser
      ..isHopitalized = isHopitalized
      ..age = age;

    await isar.writeTxn(() => isar.medicals.put(newPatient));

    fetchPatient();
  }

  // READ PATIENTS FROM DB
  Future<void> fetchPatient() async {
    List<Medical> fetchPatient = await isar.medicals.where().findAll();

    currentMedical.clear();
    currentMedical.addAll(fetchPatient);

    notifyListeners();
  }

  // UPDATE A PATIENT IN THE DB
  Future<void> updatePatient(int id, String nameFromUser,
      String diseaseFromUser, bool isHopitalized, int age) async {
    final existingPatient = await isar.medicals.get(id);

    if (existingPatient != null) {
      existingPatient.name = nameFromUser;
      existingPatient.disease = diseaseFromUser;
      existingPatient.isHopitalized = isHopitalized;
      existingPatient.age = age;

      await isar.writeTxn(() => isar.medicals.put(existingPatient));
      await fetchPatient();
    }
  }

  // DELETE A PATIENT FROM THE DB
  Future<void> deletePatient(int id) async {
    await isar.writeTxn(() => isar.medicals.delete(id));
    await fetchPatient();
  }
}
