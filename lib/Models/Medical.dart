import 'package:isar/isar.dart';

part 'Medical.g.dart';

@collection
class Medical {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  late String name;

  late String disease;

  late bool isHopitalized;

  late int age;
}
