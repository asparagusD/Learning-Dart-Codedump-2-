void main() {
  final repository = DataRepository();
  final temperature = repository.fetchTemperature('Manila');
  print(temperature);
}



abstract class DataRepository {
  double? fetchTemperature(String city);
  factory DataRepository() => FakeWebServer();
}

class FakeWebServer implements DataRepository {
  @override
  double? fetchTemperature(String city) {
    return 42.0;
  }
}