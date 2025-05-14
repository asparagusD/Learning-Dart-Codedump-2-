Future<void> main() async {
  print('Before the future');

  try {
    String message = await Future<String>.delayed(
      Duration(seconds: 2),
      () => 'I am from the future.',
    );
    print(message);
  } catch (error) {
    print(error);
  } finally {
    print('Future is complete');
  }

  print('After the future');
}
