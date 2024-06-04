import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/course.dart';

class FirebaseService {
  final String baseUrl = 'https://courseapp-bf70b-default-rtdb.europe-west1.firebasedatabase.app/application.json';

  Future<Course> fetchCourse() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return Course.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load course');
    }
  }
}
