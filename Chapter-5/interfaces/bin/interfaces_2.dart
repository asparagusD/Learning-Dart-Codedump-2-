void main() {
  final someClass = SomeClass();
  print(someClass.myField);
  someClass.myMethod();
} 


class AnotherClass {
  int myField = 42;
  void myMethod() => print(myField);
}

class SomeClass implements AnotherClass {
  @override
  int myField = 0;

  @override
  void myMethod() => print('Hello');
}