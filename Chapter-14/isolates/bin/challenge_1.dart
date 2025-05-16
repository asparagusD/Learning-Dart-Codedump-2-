import 'dart:isolate';

void fibonacci(List<Object> arguments) {
  final sendPort = arguments[0] as SendPort;
  final n = arguments[1] as int;

  int num = 1;
  int prevNum = 0;
  int temp;

  if (n == 1) {
    sendPort.send(num);
  } else {
    for (int i = 2; i <= n; i++) {
      temp = num;
      num = num + prevNum;
      prevNum = temp;
    }
    sendPort.send(num);
  }
}

Future<void> main() async {
  final receivePort = ReceivePort();

  final isolate = await Isolate.spawn<List<Object>>(
    fibonacci,
    [receivePort.sendPort, 20],
  );

  receivePort.listen((Object? message) {
    if (message is int) {
      print(message);
    }
    receivePort.close();
    isolate.kill();
  });
}
