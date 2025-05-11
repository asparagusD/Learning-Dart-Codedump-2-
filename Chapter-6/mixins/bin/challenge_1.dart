void main() {
  final calculator = Calculator();
  print(calculator.sum(2, 3));
}

class Calculator with Adder {}

mixin Adder {
  int sum(int a, int b) {
    return a + b;
  }
}
