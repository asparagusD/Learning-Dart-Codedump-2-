import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Comment {
  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> jsonMap) {
    return Comment(
      postId: jsonMap['postId'] as int,
      id: jsonMap['id'] as int,
      name: jsonMap['name'] as String,
      email: jsonMap['email'] as String,
      body: jsonMap['body'] as String,
    );
  }

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  @override
  String toString() {
    return '\n\npostId: $postId\n'
        'id: $id\n'
        'name: $name\n'
        'email: $email\n'
        'body: $body';
  }
}

Future<void> main() async {
  try {
    final url =
        'https://jsonplaceholder.typicode.com/comments';
    final commentList = <Comment>[];
    final parsedUrl = Uri.parse(url);
    final response = await http.get(parsedUrl);

    final statusCode = response.statusCode;
    if (statusCode != 200) {
      throw HttpException('$statusCode');
    }

    final jsonString = response.body;
    dynamic jsonList = jsonDecode(jsonString);

    for (final element in jsonList) {
      final comment = Comment.fromJson(element);
      commentList.add(comment);
    }
    print(commentList);
  } on SocketException catch (error) {
    print(error);
  } on HttpException catch (error) {
    print(error);
  } on FormatException catch (error) {
    print(error);
  }
}
