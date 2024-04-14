import 'package:isar/isar.dart';

part 'Patients.g.dart';

@collection
class Patients {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  late String name;

  late String disease;

  late bool isHopitalized;

  late String age;

  late DateTime dateofbook;
}
