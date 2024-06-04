import 'package:flutter/material.dart';
import 'views/course_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CourseView(),
    );
  }
}
