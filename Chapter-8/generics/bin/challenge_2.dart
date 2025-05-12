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

class Stack<E> {
  Stack(this.values);

  List<E> values;

  List<E> push(E value) {
    values.add(value);
    return values;
  }

  List<E> pop() {
    values.removeAt(values.length - 1);
    return values;
  }

  E? peek() {
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
