void main() {
  final numbers = [
    '3',
    '1E+8',
    '1.25',
    'four',
    '-0.01',
    'NaN',
    'Infinity',
  ];

  for (final number in numbers) {
    try {
      final element = double.parse(number);
      print(element);
    } on FormatException {
      handleFormatException();
      continue;
    }
  }
}

void handleFormatException() {
  print("You tried to parse a non-numeric string.");
}
