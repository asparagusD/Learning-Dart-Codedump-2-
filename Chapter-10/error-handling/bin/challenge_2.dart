void main() {
  const postalCode = 1234567;

  try {
    validatePostalCode(postalCode.toString());
    print('Your postal code is valid');
  } on InvalidPostalCode catch (e) {
    print(e.message);
  }
}

class InvalidPostalCode implements Exception {
  InvalidPostalCode(this.message);
  final String message;
}

void validateLength(String postalCode) {
  final goodLength = RegExp(r'^.{5}$');
  if (!postalCode.contains(goodLength)) {
    throw InvalidPostalCode(
      'Postal code must consist of 5 digits!',
    );
  }
}

void validatePostalCode(String postalCode) {
  validateLength(postalCode);
}
