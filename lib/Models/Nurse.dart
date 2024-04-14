import 'package:isar/isar.dart';

part 'Nurse.g.dart';

@collection
class Nurse {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  late String name;

  late String Speciality;

  late bool isAvailable;

  late String YearsofExperience;

  late String Location;
}
