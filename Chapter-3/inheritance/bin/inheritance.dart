enum Grade { A, B, C, D, E, F }

void main() {
  final jon = Person('Jon', 'Snow');
  final jane = Student('Jane', 'Snow');
  print(jon.fullName);
  print(jane.fullName);

  final historyGrade = Grade.B;
  jane.grades.add(historyGrade);

  final jessie = SchoolBandMember('Jessie', 'Jones');
  final marty = StudentAthlete('Marty', 'Mcfly');

  final students = [jane, jessie, marty];

  print(jessie is Object);
  print(jessie is Person);
  print(jessie is Student);
  print(jessie is SchoolBandMember);
  print(jessie is StudentAthlete);
}

class Person {
  Person(this.givenName, this.surname);

  String givenName;
  String surname;
  String get fullName => '$givenName $surname';

  @override
  String toString() => fullName;
}

class Student extends Person {
  Student(super.givenName, super.surname);

  var grades = <Grade>[];

  @override
  String get fullName => '$surname, $givenName';
}

class SchoolBandMember extends Student {
  SchoolBandMember(super.givenName, super.surname);

  static const minimumPracticeTime = 2;
}

class StudentAthlete extends Student {
  StudentAthlete(super.givenName, super.surname);

  bool get isEligible =>
      grades.every((grade) => grade != Grade.F);
}
