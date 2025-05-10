void main() {
  final animals = {
    'sheep': 99,
    'goats': 32,
    'snakes': 7,
    'lions': 80,
    'seals': 18,
  };

  final animalsList = animals.keys.toList();
  

  final animalWithS = animalsList.where(
    (animal) => animal.split('')[0] == 's',
  );
  

  final animalNumber = [];
  for (final a in animalWithS.toList()) {
    animalNumber.add(animals[a]);
  }
  
  final totalAnimal = animalNumber.reduce(
    (sum, element) => sum + element,
  );
  print(totalAnimal);
}
