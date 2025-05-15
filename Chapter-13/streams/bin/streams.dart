import 'dart:async';

Stream<String> consciousness() async* {
  final data = ['con', 'scious', 'ness'];
  for (final part in data) {
    await Future<void>.delayed(Duration(milliseconds: 500));
    yield part;
  }
}

void main() {
  final controller = StreamController<String>();
  final stream = controller.stream;
  final sink = controller.sink;

  stream.listen(
    (value) => print(value),
    onError: (Object error) => print(error),
    onDone: () => print('Sink closed'),
  );

  sink.add('grape');
  sink.add('grape');
  sink.add('grape');
  sink.addError(Exception('cherry'));
  sink.add('grape');
  sink.close();
}
