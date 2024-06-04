import 'package:hometask_50/models/quiz.dart';

class Lesson {
  final int id;
  final int courseId;
  final String title;
  final String description;
  final String videoUrl;
  final List<Quiz> quizes;

  Lesson({required this.id, required this.courseId, required this.title, required this.description, required this.videoUrl, required this.quizes});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      courseId: json['courseId'],
      title: json['title'],
      description: json['description'],
      videoUrl: json['videoUrl'],
      quizes: (json['quizes'] as List).map((quiz) => Quiz.fromJson(quiz)).toList(),
    );
  }
}
