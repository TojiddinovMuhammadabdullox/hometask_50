import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hometask_50/models/course.dart';

class FirebaseService {
  final String baseUrl =
      'https://courseapp-bf70b-default-rtdb.europe-west1.firebasedatabase.app/application.json';
  final http.Client client = http.Client();

  Future<Course> fetchCourse(Function(double) onProgress) async {
    final response = await client.send(http.Request('GET', Uri.parse(baseUrl)));

    if (response.statusCode == 200) {
      int total = response.contentLength ?? 0;
      int received = 0;
      final completer = Completer<Course>();
      List<int> bytes = [];

      response.stream.listen(
        (chunk) {
          bytes.addAll(chunk);
          received += chunk.length;
          double progress = received / total;
          onProgress(progress);
        },
        onDone: () {
          final String jsonString = utf8.decode(bytes);
          final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);
          completer.complete(Course.fromJson(jsonResponse));
        },
        onError: (error) {
          completer.completeError(error);
        },
        cancelOnError: true,
      );

      return completer.future;
    } else {
      throw Exception('Failed to load course');
    }
  }
}
