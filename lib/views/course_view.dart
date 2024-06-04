import 'package:flutter/material.dart';
import '../controllers/course_controller.dart';
import '../models/course.dart';

class CourseView extends StatefulWidget {
  @override
  _CourseViewState createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  final CourseController courseController = CourseController();
  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
        actions: [
          IconButton(
            icon: Icon(isGridView ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<Course>(
        future: courseController.getCourse(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          } else {
            final course = snapshot.data!;
            return isGridView ? _buildGridView(course) : _buildListView(course);
          }
        },
      ),
    );
  }

  Widget _buildGridView(Course course) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: course.lessons.length,
      itemBuilder: (context, index) {
        final lesson = course.lessons[index];
        return Card(
          child: Column(
            children: [
              Image.network(course.imageUrl),
              Text(course.title),
              Text(lesson.title),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListView(Course course) {
    return ListView.builder(
      itemCount: course.lessons.length,
      itemBuilder: (context, index) {
        final lesson = course.lessons[index];
        return ListTile(
          leading: Image.network(course.imageUrl),
          title: Text(course.title),
          subtitle: Text(lesson.title),
        );
      },
    );
  }
}
