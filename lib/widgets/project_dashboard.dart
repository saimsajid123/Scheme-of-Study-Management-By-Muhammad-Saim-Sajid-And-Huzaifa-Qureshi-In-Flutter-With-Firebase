import 'package:flutter/material.dart';

class ProjectDashboard extends StatelessWidget {
  const ProjectDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 3),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Center( // Wrap the Column with a Center widget
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Projects',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('- Courses For 6th Semester: 50% Completed'),
            Text('- Courses For 7th Semester: 75% Completed'),
            Text('- Courses For 9th Semester: 100% Completed'),
          ],
        ),
      ),
    );
  }
}
