void main() {
  final intStack = IntStack([2,4,6,8,9,1]);
  
  intStack.push(12);
  print(intStack);

  intStack.pop();
  print(intStack);

  print(intStack.peek());

  print(intStack.isEmpty());
  print(intStack.toString());
}

class IntStack {
  IntStack(this.values);

  List<int> values;

  List<int> push(int value) {
    values.add(value);
    return values;
  }

  List<int> pop() {
    values.removeAt(values.length - 1);
    return values;
  }

  int peek() {
    return values.last;
  }

  bool isEmpty() {
    return values.isEmpty;
  }

  @override
  String toString() {
    return '$values';
  }
}

