void main() {
  final timeRemaining = 6.minutes;
  print(timeRemaining);
}

extension on int {
  int get minutes {
    final duration = Duration(minutes: this);
    return duration.inMinutes;
  }
}