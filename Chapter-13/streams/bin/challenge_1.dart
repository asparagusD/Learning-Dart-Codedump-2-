import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> main() async {
  try {
    final url = Uri.parse('https://kodeco.com');
    final client = http.Client();
    final request = http.Request('GET', url);
    final response = await client.send(request);
    final stream = response.stream;

    final stringStream = stream.transform(utf8.decoder);
    stringStream.listen(
      (data) {
        print(data.length);
      },

      onDone: () {
        print('All finished');
      },
    );
  } on Exception catch (error) {
    print(error);
  }
}
