import 'dart:isolate';
import 'dart:convert';

void parseJson(List<Object> arguments) {
  final sendPort = arguments[0] as SendPort;
  final jsonString = arguments[1] as String;

  final decoded = json.decode(jsonString);
  sendPort.send(decoded);
}

Future<void> main() async {
  const jsonString = '''
{
  "language": "Dart",
  "feeling": "love it",
  "level": "intermediate"
}
''';

  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn<List<Object>>(parseJson, [
    receivePort.sendPort,
    jsonString,
  ]);

  receivePort.listen((Object? message) {
    if (message is Map) {
      print(message);
    }

    receivePort.close();
    isolate.kill();
  });
}
