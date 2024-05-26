import 'package:flutter/material.dart';
import 'package:scheme_of_study_management/models/teacher.dart';
import 'package:scheme_of_study_management/widgets/teachers_list.dart';

class TeacherStudyManagementScreen extends StatefulWidget {
  const TeacherStudyManagementScreen({Key? key}) : super(key: key);

  @override
  TeacherStudyManagementScreenState createState() =>
      TeacherStudyManagementScreenState();
}

class TeacherStudyManagementScreenState
    extends State<TeacherStudyManagementScreen> {
  final TextEditingController _teacherNameController =
      TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _courseHourController = TextEditingController();
  final TextEditingController _courseCodeController = TextEditingController();

  List<Teacher> teachers = []; // Define the list of teachers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Study Management'),
      ),
      body: TeachersList(teachers: teachers), // Pass the list of teachers to TeachersList
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTeacherForm,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTeacherForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Teacher'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _teacherNameController,
                  decoration: const InputDecoration(
                    labelText: 'Teacher Name',
                  ),
                ),
                TextField(
                  controller: _subjectController,
                  decoration: const InputDecoration(
                    labelText: 'Subject',
                  ),
                ),
                TextField(
                  controller: _courseHourController,
                  decoration: const InputDecoration(
                    labelText: 'Credit Hour',
                  ),
                ),
                TextField(
                  controller: _courseCodeController,
                  decoration: const InputDecoration(
                    labelText: 'Course Code',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: _addTeacher,
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addTeacher() {
    final teacherName = _teacherNameController.text.trim();
    final subject = _subjectController.text.trim();
    final courseHour = _courseHourController.text.trim();
    final courseCode = _courseCodeController.text.trim();

    if (teacherName.isNotEmpty &&
        subject.isNotEmpty &&
        courseHour.isNotEmpty &&
        courseCode.isNotEmpty) {
      final newTeacher = Teacher(
        name: teacherName,
        subject: subject,
        courseHour: courseHour,
        courseCode: courseCode,
      );

      setState(() {
        teachers.add(newTeacher);
        _clearFields();
      });

      Navigator.of(context).pop(); // Close the dialog

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Teacher added successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  void _clearFields() {
    _teacherNameController.clear();
    _subjectController.clear();
    _courseHourController.clear();
    _courseCodeController.clear();
  }
}
