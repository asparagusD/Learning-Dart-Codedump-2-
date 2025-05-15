Future<void> main() async {
  final myStream = Stream<int>.periodic(
    Duration(seconds: 1),
    (value) => value,
  ).take(10);

  await for (var data in myStream) {
    print(data);
  }
}
