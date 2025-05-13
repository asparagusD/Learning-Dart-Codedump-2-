enum Day {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  Day operator -(int days) {
    final numberOfItems = Day.values.length;
    final index = (this.index - days) % numberOfItems;

    return Day.values[index];
  }

  String get displayName {
    List<String> toList = name.split('');
    toList[0] = toList[0].toUpperCase();
    
    return toList.join();
  }
}

void main() {
  var day = Day.monday;

  day = day - 2;
  print(day.name);

  day -= 4;
  print(day.name);

  day--;
  print(day.name);

  print(day.displayName);
}
