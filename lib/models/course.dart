import 'package:hometask_50/models/lesson.dart';

class Course {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final List<Lesson> lessons;
  final String price;

  Course({required this.id, required this.title, required this.description, required this.imageUrl, required this.lessons, required this.price});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      lessons: (json['lessons'] as List).map((lesson) => Lesson.fromJson(lesson)).toList(),
      price: json['price'],
    );
  }
}
