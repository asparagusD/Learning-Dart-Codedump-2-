void main() {
  final emailAddress = 'nufel1130@gmail.com';
  final validEmail = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  final validEmailLength = RegExp(r'.{4,320}');

  if (!emailAddress.contains(validEmail)) {
    print('Invalid Email! Your email contains more than one @ or whitespace!');
  } else if (!emailAddress.contains(validEmailLength)) {
    print('Your email is too long or too short!');
  } else {
    print('Your email is valid.');
  }
}