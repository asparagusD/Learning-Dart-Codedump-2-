import 'dart:async';
import 'dart:math';

abstract class DataRepository {
  Future<double> fetchTemperature(String city);
}

class FakeWebServer implements DataRepository {
  @override
  Future<double> fetchTemperature(String city) {
    final completer = Completer<double>();
    final temperature = Random().nextDouble() * 100 + 1;
    if (temperature <= 50) {
      completer.complete(temperature);
    } else {
      completer.completeError(ArgumentError("Invalid temperature."));
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
