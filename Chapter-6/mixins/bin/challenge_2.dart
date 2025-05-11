void main() {
  final list = [];
  final platypusFirst = Platypus(weight: 12);
  final platypusSecond = Platypus(weight: 16);
  final platypusThird = Platypus(weight: 14);
  final platypusFourth = Platypus(weight: 20);

  list.add(platypusFirst);
  list.add(platypusSecond);
  list.add(platypusThird);
  list.add(platypusFourth);
  list.sort();
  print(list);

}

abstract class Animal {
  bool isAlive = true;
  void eat();
  void move();

  @override
  String toString() {
    return "I'm a $runtimeType";
  }
}

class Platypus extends Animal
    with EggLayer
    implements Comparable<Platypus> {
  Platypus({required this.weight});
  double weight;

  @override
  int compareTo(Platypus other) {
    return weight.compareTo(other.weight);
  }

  @override
  void eat() {
    print('Munch munch');
  }

  @override
  void move() {
    print('Glide glide');
  }

  @override
  String toString() {
    return '$weight';
  }
}

mixin EggLayer {
  void layEggs() {
    print('Plop plop');
  }
}
