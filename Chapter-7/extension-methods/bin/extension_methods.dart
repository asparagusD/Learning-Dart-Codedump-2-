void main() {
  final original = 'I like extensions!';
  final secret = original.encoded;
  final revealed = secret.decoded;
  print(secret);
  print(revealed);

  print(5.cubed);

  final secretMsg = '''Uif!tfdsfu!up!mfbsojoh!Ebsu!xfmm!jt!up!dg"ewtkqwu"cpf"lwuv"vt{"vjkpiu0"Vlqfh#|rx*uh#uhdglqj#wklv/#wkdw#reylrxvo|
 #ghvfulehv#|rx1#Kssh\$nsf%''';
 print(secretMsg.decoded.decoded.decoded.decoded);
}

String encode(String input) {
  final output = StringBuffer();
  for (final codePoint in input.runes) {
    output.writeCharCode(codePoint + 1);
  }
  return output.toString();
}

extension on String {

  String get encoded => _code(1);
  String get decoded => _code(-1);

  String _code(int step) {
    final output = StringBuffer();
    for (final codePoint in runes) {
      output.writeCharCode(codePoint + step);
    }
    return output.toString();
  }
}

extension on int {
  int get cubed {
    return this * this * this;
  }
}