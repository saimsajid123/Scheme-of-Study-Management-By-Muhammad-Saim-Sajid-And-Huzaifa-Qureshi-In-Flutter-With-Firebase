import 'package:flutter/material.dart';
import 'package:scheme_of_study_management/models/student.dart';

class AddStudentDialog extends StatefulWidget {
  final void Function(Student) onAdd;

  const AddStudentDialog({super.key, required this.onAdd});

  @override
  _AddStudentDialogState createState() => _AddStudentDialogState();
}

class _AddStudentDialogState extends State<AddStudentDialog> {
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _cgpaController = TextEditingController();

  void _submit() {
    final String name = _studentNameController.text.trim();
    final String cgpa = _cgpaController.text.trim();

    if (name.isNotEmpty && cgpa.isNotEmpty) {
      final newStudent = Student(name: name, cgpa: cgpa);
      widget.onAdd(newStudent);
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Student'),
      content: SingleChildScrollView(
        child: Column(
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
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _submit,
          child: const Text('Add'),
        ),
      ],
    );
  }
}
