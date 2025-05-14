import 'dart:async';

abstract class DataRepository {
  Future<double> fetchTemperature(String city);
}

class FakeWebServer implements DataRepository {
  @override
  Future<double> fetchTemperature(String city) {
    final completer = Completer<double>();
    if (city == 'Portland') {
      completer.complete(42.0);
    } else {
      completer.completeError(ArgumentError("City doesn't exist."));
    }
    return completer.future;
  }
}

Future<void> main() async {
  final web = FakeWebServer();
  try {
    final city = 'Portland';
    final degrees = await web.fetchTemperature(city);
    print("It's $degrees degrees in $city");
  } on ArgumentError catch (error) {
    print(error);
  }
}
