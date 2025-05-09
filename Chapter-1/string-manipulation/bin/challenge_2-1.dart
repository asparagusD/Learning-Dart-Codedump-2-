void main() {
  const text = '[00:12.34]Row, row, row your boat';

  final startMinutes = text.indexOf('[') + '['.length;
  final endMinutes = text.indexOf(':');
  final minutes = text.substring(startMinutes, endMinutes);
  print('minutes: $minutes');

  final startSeconds = text.indexOf(':') + ':'.length;
  final endSeconds = text.indexOf('.');
  final seconds = text.substring(startSeconds, endSeconds);
  print('seconds: $seconds');

  final startHundredths = text.indexOf('.') + '.'.length;
  final endHundredths = text.indexOf(']');
  final hundredths = text.substring(startHundredths, endHundredths);
  print('hundredths: $hundredths');

  final startLyrics = text.indexOf(']') + ']'.length;
  final lyrics = text.substring(startLyrics);
  print('lyrics: $lyrics');
}
