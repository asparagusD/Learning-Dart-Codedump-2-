void main() {
  final dataRepo = DataRepository();
  final myNotes = dataRepo.fetchData('call');
  print(myNotes);
}


abstract class DataRepository {
  String? fetchData(String call);
  factory DataRepository() => FakeDatabase();
}

class FakeDatabase implements DataRepository {
  @override
  String? fetchData(String call) {
    return 'Mock data';
  }
}