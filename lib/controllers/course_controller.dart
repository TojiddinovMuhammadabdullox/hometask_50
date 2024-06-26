import 'package:hometask_50/services/firebase_services.dart';
import '../models/course.dart';

class CourseController {
  final FirebaseService firebaseService = FirebaseService();
  double downloadProgress = 0.0;

  Future<Course> getCourse(Function(double) onProgress) {
    return firebaseService.fetchCourse((progress) {
      downloadProgress = progress;
      onProgress(progress);
    });
  }
}
