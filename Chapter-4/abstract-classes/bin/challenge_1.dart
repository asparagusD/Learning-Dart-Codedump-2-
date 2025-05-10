void main() {
  final localStorage = LocalStorage();
  localStorage.save();
  localStorage.retrieve();

  final cloudStorage = CloudStorage();
  cloudStorage.save();
  cloudStorage.retrieve();
}

abstract class Storage {
  void save() {
    print('Just save it!');
  }

  void retrieve() {
    print('Just retrieve it!');
  }
}

class LocalStorage extends Storage {}
class CloudStorage extends Storage {}