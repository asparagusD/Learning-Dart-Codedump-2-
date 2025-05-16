import 'dart:isolate';

void playHideAndSeekTheLongVersion(List<Object> arguments) {
  final sendPort = arguments[0] as SendPort;
  final countTo = arguments[1] as int;

  sendPort.send("OK, I'm counting...");

  var counting = 0;
  for (var i = 1; i <= countTo; i++) {
    counting = i;
  }

  sendPort.send('$counting! Ready or not, here I come!');
  sendPort.send(null);
}

Future<void> main() async {
  final receivePort = ReceivePort();

  final isolate = await Isolate.spawn<List<Object>>(
    playHideAndSeekTheLongVersion,
    [receivePort.sendPort, 999999999],
  );

  receivePort.listen((Object? message) {
    if (message is String) {
      print(message);
    } else if (message == null) {
      receivePort.close();
      isolate.kill();
    }
  });
}
