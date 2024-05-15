import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integrated Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntegratedDashboard(),
    );
  }
}

class IntegratedDashboard extends StatelessWidget {
  const IntegratedDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Integrated Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Overview',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    DashboardCard(
      title: 'Total Teachers',
      value: '100',
      color: Colors.orange,
    ),
    DashboardCard(
      title: 'Total Courses',
      value: '50',
      color: Colors.blue,
    ),
    DashboardCard(
      title: 'Total Students',
      value: '5000',
      color: Colors.green,
    ),
  ],
),


            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Project Management',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const ProjectDashboard(),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Scheme Of Study Management',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TeacherStudyManagementScreen(),
                      ),
                    );
                  },
                  child: const Text('Teacher'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StudentStudyManagementScreen(),
                      ),
                    );
                  },
                  child: const Text('Student'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  // Use a factory constructor
  const DashboardCard({
    Key? key,
    required this.title,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(fontSize: 24, color: color),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectDashboard extends StatelessWidget {
  const ProjectDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        SummaryCard(), // Made it const
        ProjectList(), // Removed Expanded here
      ],
    );
  }
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            Text(
              'Projects Summary',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            

          ],
        ),
      ),
    );
  }
}

class SummaryItem extends StatelessWidget {
  final String label;
  final int count;

  const SummaryItem({Key? key, required this.label, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4.0),
        Text('$count projects'),
      ],
    );
  }
}

class ProjectList extends StatelessWidget {
  const ProjectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Project> projects = [
      Project(
        name: 'Courses',
        status: 'Finished',
        description: 'For 6th Semester',
        completion: 100,
        estimatedCompletionDate: '2023-09-30',
      ),
      Project(
        name: 'Courses',
        status: 'In Progress',
        description: 'For 7th Semester',
        completion: 50,
        estimatedCompletionDate: '2023-06-10',
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return ListTile(
          title: Text(project.name),
          subtitle: Text(project.description),
          trailing: Text('${project.completion}%'),
        );
      },
    );
  }
}

class Project {
  final String name;
  final String status;
  final String description;
  final int completion;
  final String estimatedCompletionDate;

  Project({
    required this.name,
    required this.status,
    required this.description,
    required this.completion,
    required this.estimatedCompletionDate,
  });
}

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

class TeacherStudyManagementScreen extends StatefulWidget {
  const TeacherStudyManagementScreen({Key? key}) : super(key: key);

  @override
  TeacherStudyManagementScreenState createState() => TeacherStudyManagementScreenState();
}

class TeacherStudyManagementScreenState extends State<TeacherStudyManagementScreen> {
  final List<Course> _courses = [];
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _creditsController = TextEditingController();
  final TextEditingController _scheduleController = TextEditingController();
  String? selectedSemester;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Study Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _courseNameController,
              decoration: const InputDecoration(
                labelText: 'Course Name',
              ),
            ),
            TextField(
              controller: _creditsController,
              decoration: const InputDecoration(
                labelText: 'Credits',
              ),
            ),
            TextField(
              controller: _scheduleController,
              decoration: const InputDecoration(
                labelText: 'Schedule',
              ),
            ),
            const SizedBox(height: 16.0),
            DropdownButton<String?>(
              value: selectedSemester,
              onChanged: (newValue) {
                setState(() {
                  selectedSemester = newValue;
                });
              },
              items: semesters.map((semester) {
                return DropdownMenuItem<String?>(
                  value: semester,
                  child: Text(semester),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: _addCourse,
              child: const Text('Add'),
            ),
            SizedBox(
              height: 200, // Adjust the height according to your UI requirements
              child: ListView.builder(
                itemCount: _courses.length,
                itemBuilder: (context, index) {
                  final course = _courses[index];
                  return ListTile(
                    title: Text(course.name),
                    subtitle: Text('${course.credits} credits'),
                    trailing: Text(course.schedule),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addCourse() async {
    final courseName = _courseNameController.text.trim();
    final credits = _creditsController.text.trim();
    final schedule = _scheduleController.text.trim();

    if (courseName.isNotEmpty && credits.isNotEmpty && schedule.isNotEmpty) {
      final newCourse = Course(
        name: courseName,
        instructor: 'Sir Nauman', // Assuming the teacher's name is fixed
        credits: credits,
        schedule: schedule,
      );

      setState(() {
        _courses.add(newCourse);
        _clearFields();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Course added successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  void _clearFields() {
    _courseNameController.clear();
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

class StudentStudyManagementScreen extends StatelessWidget {
  const StudentStudyManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Study Management'),
      ),
      body: const Center(
        child: Text('Student Study Management Screen'),
      ),
    );
  }
}
