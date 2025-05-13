enum HttpCodes {
  code402(402, 'Payment Required'),
  code403(403, 'Forbidden'),
  code404(404, 'Not Found'),
  code418(418, "I'm a teapot"),
  code451(451, 'Unavailable For Legal Reasons'),
  code502(502, 'Bad Gateway');

  const HttpCodes(this.code, this.meaning);
  final int code;
  final String meaning;
}

void main() {
  final httpCode = HttpCodes.code404;
  print('${httpCode.code}: ${httpCode.meaning}');
}
