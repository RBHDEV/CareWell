class APatient {
  late String name;
  late String disease;
  late int age;
  late bool ishospitalized;

  APatient({
    required this.name,
    required this.disease,
    required this.age,
    required this.ishospitalized,
  });
}

List<APatient> thePatientList = [
  APatient(
      name: 'Jones Bishop',
      disease: 'Acute cholecystitis',
      age: 25,
      ishospitalized: false),
  APatient(
      name: 'Thea Griffith',
      disease: 'Allergic rhinitis',
      age: 38,
      ishospitalized: true),
  APatient(
      name: 'Daniel Contreras',
      disease: 'Bone cancer',
      age: 50,
      ishospitalized: false),
  APatient(
      name: 'Miley Russell',
      disease: 'Chlamydia',
      age: 20,
      ishospitalized: true),
  APatient(
      name: 'Itzel Rich',
      disease: 'Depression',
      age: 14,
      ishospitalized: false),
  APatient(
    name: 'Sarah Lee',
    disease: 'Flu',
    age: 32,
    ishospitalized: true,
  ),
  APatient(
    name: 'Alex Miller',
    disease: 'Sprained ankle',
    age: 18,
    ishospitalized: false,
  ),
  APatient(
    name: 'Olivia Garcia',
    disease: 'Diabetes',
    age: 65,
    ishospitalized: true,
  ),
  APatient(
    name: 'Noah Hernandez',
    disease: 'Food poisoning',
    age: 7,
    ishospitalized: false,
  ),
  APatient(
    name: 'Sophia Parker',
    disease: 'Headache',
    age: 42,
    ishospitalized: false,
  ),
];
