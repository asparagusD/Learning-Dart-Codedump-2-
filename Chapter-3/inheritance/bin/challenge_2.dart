enum Role { athlete, bandMember, unionMember }

void main() {
  final jon = Student();
  final moon = Student();
  
  final athleteRole = Role.athlete;
  jon.roles.add(athleteRole);
  print(jon.roles);

  final bandMemberRole = Role.bandMember;
  jon.roles.add(bandMemberRole);
  print(jon.roles);

  final unionMemberRole = Role.unionMember;
  moon.roles.add(unionMemberRole);
  print(moon.roles);
}

class Person {
  Person();
}

class Student extends Person {
  Student();

  var roles = <Role>[];
}
