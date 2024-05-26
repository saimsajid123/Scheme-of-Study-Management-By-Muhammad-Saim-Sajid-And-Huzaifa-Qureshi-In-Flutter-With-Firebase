import 'package:flutter/material.dart';
import 'package:scheme_of_study_management/models/student.dart';

class StudentsList extends StatelessWidget {
  final List<Student> students;

  const StudentsList({super.key, required this.students});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return ListTile(
          title: Text(student.name),
          subtitle: Text('CGPA: ${student.cgpa}'),
        );
      },
    );
  }
}
