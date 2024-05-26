import 'package:flutter/material.dart';
import 'package:scheme_of_study_management/screens/student_study_management_screen.dart';
import 'package:scheme_of_study_management/screens/teacher_study_management_screen.dart';
import 'package:scheme_of_study_management/widgets/dashboard_card.dart';
import 'package:scheme_of_study_management/widgets/project_dashboard.dart';

class IntegratedDashboard extends StatelessWidget {
  const IntegratedDashboard({super.key});

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
            const Row(
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
                  child: const Text('Teacher and Courses'),
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
