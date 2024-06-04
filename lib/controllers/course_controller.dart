import 'package:flutter/material.dart';
import 'package:hometask_50/services/firebase_services.dart';
import '../models/course.dart';

class CourseController {
  final FirebaseService firebaseService = FirebaseService();

  Future<Course> getCourse() {
    return firebaseService.fetchCourse();
  }
}
