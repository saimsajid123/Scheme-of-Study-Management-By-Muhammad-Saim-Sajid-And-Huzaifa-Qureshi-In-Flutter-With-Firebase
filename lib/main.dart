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
      home: LoginScreen(),
    );
  }
}

class AuthService {
  // Hardcoded authentication for demonstration
  Future<void> signIn(String email, String password) async {
    if (email == 'admin@gmail.com' && password == 'admin') {
      // Authentication successful
      print('Logged in: $email');
    } else {
      // Authentication failed
      throw Exception('Invalid email or password');
    }
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Hardcoded email and password for demonstration
                final String email = emailController.text;
                final String password = passwordController.text;

                // Authenticate the user with the provided email and password
                AuthService().signIn(email, password)
                    .then((_) {
                  // If authentication is successful, navigate to the dashboard
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => IntegratedDashboard()),
                  );
                })
                    .catchError((error) {
                  // If authentication fails, show an error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Authentication failed')),
                  );
                });
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
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
        SummaryCard(),
        ProjectList(),
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

class StudentStudyManagementScreen extends StatefulWidget {
  const StudentStudyManagementScreen({Key? key}) : super(key: key);

  @override
  _StudentStudyManagementScreenState createState() => _StudentStudyManagementScreenState();
}

class _StudentStudyManagementScreenState extends State<StudentStudyManagementScreen> {
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _cgpaController = TextEditingController();
  final List<Student> _students = [
    Student(name: 'Muhammad Saim Sajid', cgpa: '3.87'),
    Student(name: 'Huzaifa Qureshi', cgpa: '3.3'),
    Student(name: 'Shoaib Ahmed', cgpa: '3.6'),
    Student(name: 'Mudassir Khan', cgpa: '3.5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Study Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'List of Students',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200, // Adjust the height according to your UI requirements
              child: ListView.builder(
                itemCount: _students.length,
                itemBuilder: (context, index) {
                  final student = _students[index];
                  return ListTile(
                    title: Text(student.name),
                    subtitle: Text(student.cgpa.isNotEmpty ? student.cgpa : 'No CGPA'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddStudentForm(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddStudentForm(BuildContext context) {
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
              onPressed: () {
                _addStudent();
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addStudent() {
    final studentName = _studentNameController.text.trim();
    final cgpa = _cgpaController.text.trim();

    if (studentName.isNotEmpty && cgpa.isNotEmpty) {
      final newStudent = Student(
        name: studentName,
        cgpa: cgpa,
      );

      setState(() {
        _students.add(newStudent);
        _clearFields();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Student added successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  void _clearFields() {
    _studentNameController.clear();
    _cgpaController.clear();
  }
}

class Student {
  final String name;
  final String cgpa;

  Student({
    required this.name,
    required this.cgpa,
  });
}

class TeacherStudyManagementScreen extends StatefulWidget {
  const TeacherStudyManagementScreen({Key? key}) : super(key: key);

  @override
  TeacherStudyManagementScreenState createState() => TeacherStudyManagementScreenState();
}

class TeacherStudyManagementScreenState extends State<TeacherStudyManagementScreen> {
  final List<Teacher> _teachers = [
    Teacher(name: 'Dr Nauman', subject: 'Mobile Application Development'),
    Teacher(name: 'Rao Zulqarnain', subject: 'Software Quality Engineering'),
    Teacher(name: 'Nabeel Sarvar', subject: 'Aritficial Intelligence'),
    Teacher(name: 'Hafiz Utaullah', subject: 'Formal Methods'),
  ];

  final TextEditingController _teacherNameController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Study Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'List of Teachers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200, // Adjust the height according to your UI requirements
              child: ListView.builder(
                itemCount: _teachers.length,
                itemBuilder: (context, index) {
                  final teacher = _teachers[index];
                  return ListTile(
                    title: Text(teacher.name),
                    subtitle: Text(teacher.subject.isNotEmpty ? teacher.subject : 'No subject'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTeacherForm,
        child: Icon(Icons.add),
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

    if (teacherName.isNotEmpty && subject.isNotEmpty) {
      final newTeacher = Teacher(
        name: teacherName,
        subject: subject,
      );

      setState(() {
        _teachers.add(newTeacher);
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
  }
}

class Teacher {
  final String name;
  final String subject;

  Teacher({
    required this.name,
    required this.subject,
  });
}

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement registration logic
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
