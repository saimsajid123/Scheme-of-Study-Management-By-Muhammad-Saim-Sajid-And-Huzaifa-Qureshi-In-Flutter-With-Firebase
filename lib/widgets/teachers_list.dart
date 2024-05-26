import 'package:flutter/material.dart';

import 'package:scheme_of_study_management/models/teacher.dart';

class TeachersList extends StatelessWidget {
  final List<Teacher> teachers;

  const TeachersList({Key? key, required this.teachers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 3),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16.0),
        width: 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'List of Teachers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height:
                  200, // Adjust the height according to your UI requirements
              child: ListView.builder(
                itemCount: teachers.length,
                itemBuilder: (context, index) {
                  final teacher = teachers[index];
                  return ListTile(
                    title: Text(teacher.name),
                    subtitle: Text(
                        '${teacher.subject}, Course Hour: ${teacher.courseHour}, Course Code: ${teacher.courseCode}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
