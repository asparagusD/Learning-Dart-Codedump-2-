void main() {
  final intStack = Stack([]);

  intStack.push(false);
  print(intStack);

  intStack.pop();
  print(intStack);

  print(intStack.peek());

  print(intStack.isEmpty());
  print(intStack.toString());
}

class Stack<T> {
  Stack(this.values);

  List<T> values;

  List<T> push(T value) {
    values.add(value);
    return values;
  }

  List<T> pop() {
    values.removeAt(values.length - 1);
    return values;
  }

  T? peek() {
    if (values.isEmpty) {
      return null;
    } else {
      return values.last;
    }
  }

  bool isEmpty() {
    return values.isEmpty;
  }

  @override
  String toString() {
    return '$values';
  }
}
