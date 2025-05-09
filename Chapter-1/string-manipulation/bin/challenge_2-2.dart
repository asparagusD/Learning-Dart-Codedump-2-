void main() {
  const text = '[00:12.34]Row, row, row your boat';

  final expTime = RegExp(r'([0-9]+)');
  final matchesTime = expTime.allMatches(text);

  final minutes = matchesTime.elementAt(0)[0];
  print('minutes: $minutes');
  final seconds = matchesTime.elementAt(1)[0];
  print('seconds: $seconds');
  final hundredths = matchesTime.elementAt(2)[0];
  print('hundredths: $hundredths');

  final expLyrics = RegExp(r'[^0-9[\]:\.]+');
  final matchesLyrics = expLyrics.allMatches(text);
  final lyrics = matchesLyrics.elementAt(0)[0];
  print('lyrics: $lyrics');
}
