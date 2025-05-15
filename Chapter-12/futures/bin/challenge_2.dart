import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  const base =
      'https://fcc-weather-api.glitch.me/api/current';
  const latitude = 45.5;
  const longitude = -122.7;
  final url = Uri.parse(
    '$base?lat=$latitude&lon=$longitude',
  );
  try {
    final response = await http.get(url);
    final statusCode = response.statusCode;
    if (statusCode != 200) {
      throw HttpException('$statusCode');
    }
    final jsonString = response.body;
    final jsonMap =
        jsonDecode(jsonString) as Map<String, dynamic>;
    print(jsonMap);
    final temperature = jsonMap['main']['temp'] as double;
    final city = jsonMap['name'] as String;
    print("It's $temperature degrees in $city.");
  } on SocketException catch (error) {
    print(error);
  } on HttpException catch (error) {
    print(error);
  } on FormatException catch (error) {
    print(error);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) =>
              true;
  }
}
