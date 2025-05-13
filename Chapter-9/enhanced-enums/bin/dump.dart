void main() {
  String day = 'monday';
  List<String> toList = day.split('');
  print(toList);

  toList[0] = toList[0].toUpperCase();
  print(toList);

  toList.join();
  
}