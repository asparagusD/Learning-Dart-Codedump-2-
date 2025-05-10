void main() {
  final fruit = Fruit();
  print(fruit.describeColor('yellow'));

  final melon = Melon();
  print(melon.describeColor('black'));

  final watermelon = Watermelon();
  print(watermelon.describeColor('green'));

  final cantaloupe = Cantaloupe();
  print(cantaloupe.describeColor('brown'));
}

class Fruit {
  Fruit([this.color]);

  String? color;
  String describeColor(color) {
    return '$color';
  }
}

class Melon extends Fruit {
  Melon([super.color]);
}

class Watermelon extends Melon {
  Watermelon([super.color]);

  @override
  String describeColor(color) {
    return "It's $color on the outside but red on the inside.";
  }
}

class Cantaloupe extends Melon {
  Cantaloupe([super.color]);
}