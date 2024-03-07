import 'package:flutter/material.dart';

void main() {
  runApp(StudyManagementApp());
}

class StudyManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Management',
      home: StudyManagementScreen(),
    );
  }
}

class StudyManagementScreen extends StatefulWidget {
  @override
  _StudyManagementScreenState createState() => _StudyManagementScreenState();
}

class _StudyManagementScreenState extends State<StudyManagementScreen> {
  final List<Course> _courses = [];
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _instructorController = TextEditingController();
  final TextEditingController _creditsController = TextEditingController();
  final TextEditingController _scheduleController = TextEditingController();
  String? selectedTeacher;
  String? selectedSemester;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Management'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _courseNameController,
              decoration: InputDecoration(
                labelText: 'Course Name',
              ),
            ),
            TextField(
              controller: _instructorController,
              decoration: InputDecoration(
                labelText: 'Instructor',
              ),
            ),
            TextField(
              controller: _creditsController,
              decoration: InputDecoration(
                labelText: 'Credits',
              ),
            ),
            TextField(
              controller: _scheduleController,
              decoration: InputDecoration(
                labelText: 'Schedule',
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedTeacher,
              onChanged: (newValue) {
                setState(() {
                  selectedTeacher = newValue;
                });
              },
              items: teachers.map((teacher) {
                return DropdownMenuItem<String>(
                  value: teacher,
                  child: Text(teacher),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              value: selectedSemester,
              onChanged: (newValue) {
                setState(() {
                  selectedSemester = newValue;
                });
              },
              items: semesters.map((semester) {
                return DropdownMenuItem<String>(
                  value: semester,
                  child: Text(semester),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: _addCourse,
              child: Text('Add'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _courses.length,
                itemBuilder: (context, index) {
                  final course = _courses[index];
                  return ListTile(
                    title: Text(course.name),
                    subtitle: Text('${course.instructor} - ${course.credits} credits'),
                    trailing: Text(course.schedule),
                    onTap: () {
                      // Handle course selection (e.g., show details, edit, etc.)
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _removeCourse,
                  child: Text('Remove'),
                ),
                ElevatedButton(
                  onPressed: _updateCourse,
                  child: Text('Update'),
                ),
                ElevatedButton(
                  onPressed: _saveChanges,
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _addCourse() {
    final courseName = _courseNameController.text.trim();
    final instructor = _instructorController.text.trim();
    final credits = _creditsController.text.trim();
    final schedule = _scheduleController.text.trim();

    if (courseName.isNotEmpty && instructor.isNotEmpty && credits.isNotEmpty && schedule.isNotEmpty) {
      final newCourse = Course(
        name: courseName,
        instructor: instructor,
        credits: credits,
        schedule: schedule,
      );
      setState(() {
        _courses.add(newCourse);
        _clearFields();
      });
    }
  }

  void _removeCourse() {
    if (_courses.isNotEmpty) {
      setState(() {
        _courses.removeAt(_courses.length - 1);
      });
    }
  }

  void _updateCourse() {
    // Implement course update logic (e.g., edit course details)
  }

  void _saveChanges() {
    // Implement saving changes logic (e.g., persist data to storage)
  }

  void _clearFields() {
    _courseNameController.clear();
    _instructorController.clear();
    _creditsController.clear();
    _scheduleController.clear();
  }
}

class Course {
  final String name;
  final String instructor;
  final String credits;
  final String schedule;

  Course({
    required this.name,
    required this.instructor,
    required this.credits,
    required this.schedule,
  });
}

List<String> teachers = [
  'Sir Nauman',
  'Sir Nabeel',
  'Sir Zulqarnain',

];

List<String> semesters = [
  'Semester 1',
  'Semester 2',
  'Semester 3',
  'Semester 4',
  'Semester 5',
  'Semester 6',
  'Semester 7',
  'Semester 8',
];
