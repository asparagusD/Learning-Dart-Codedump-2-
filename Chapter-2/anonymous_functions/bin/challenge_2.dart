void main() {
  final squared = repeatTask(4, 2, (x) => x * x);
  print(squared);
}

int repeatTask(int times, int input, Function task) {
  
    int repeat;
    for (int i = 1; i <= times; i++) {
      repeat = task(input);
      input = repeat;
    }
    return input;
  
  
}