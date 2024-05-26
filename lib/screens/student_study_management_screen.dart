// main.dart or screens/student_study_management_screen.dart
import 'package:flutter/material.dart';
import 'package:scheme_of_study_management/models/student.dart';
import 'package:scheme_of_study_management/widgets/students_list.dart';
// import 'package:scheme_of_study_management/widgets/add_student_dialog.dart';

class StudentStudyManagementScreen extends StatefulWidget {
  const StudentStudyManagementScreen({super.key});

  @override
  StudentStudyManagementScreenState createState() =>
      StudentStudyManagementScreenState();
}

class StudentStudyManagementScreenState
    extends State<StudentStudyManagementScreen> {
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _cgpaController = TextEditingController();

  List<Student> _students = [
    Student(name: 'Muhammad Saim Sajid', cgpa: '3.87'),
    Student(name: 'Huzaifa Qureshi', cgpa: '3.3'),
    Student(name: 'Shoaib Ahmed', cgpa: '3.6'),
    Student(name: 'Mudassir Khan', cgpa: '3.5'),
  ];

  void _addStudent() {
    final studentName = _studentNameController.text.trim();
    final cgpa = _cgpaController.text.trim();

    if (studentName.isNotEmpty && cgpa.isNotEmpty) {
      final newStudent = Student(name: studentName, cgpa: cgpa);

      setState(() {
        _students.add(newStudent);
        _clearFields();
      });

      Navigator.of(context).pop(); // Close the dialog

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Student added successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  void _showAddStudentForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Student'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _studentNameController,
                  decoration: const InputDecoration(
                    labelText: 'Student Name',
                  ),
                ),
                TextField(
                  controller: _cgpaController,
                  decoration: const InputDecoration(
                    labelText: 'CGPA',
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
              onPressed: _addStudent,
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _clearFields() {
    _studentNameController.clear();
    _cgpaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Study Management'),
      ),
      body: StudentsList(students: _students),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddStudentForm,
        child: const Icon(Icons.add),
      ),
    );
  }
}
