import 'package:flutter/material.dart';
import 'dashboard_card.dart';

class IntegratedDashboard extends StatelessWidget {
  const IntegratedDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Integrated Dashboard'), // Removed 'const'
          bottom: TabBar(
            tabs: [
              Tab(text: 'Overview'), // Removed 'const'
              Tab(text: 'Project Summary'), // Removed 'const'
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(16.0), // Removed 'const'
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.0), // Removed 'const'
                    child: Text(
                      'Overview',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Wrap(
                    spacing: 16.0, // Horizontal spacing between cards
                    runSpacing: 16.0, // Vertical spacing between rows of cards
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
                  SizedBox(height: 20), // Removed 'const'
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.0), // Removed 'const'
                    child: Text(
                      'Project Management',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Other widgets related to project management can be added here
                ],
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(16.0), // Removed 'const'
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0), // Removed 'const'
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Project Summary',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10), // Removed 'const'
                        Text(
                          'This is a summary of your project.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 16), // Add some spacing
                        Text(
                          'Project Name: LMS App',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Description: This project aims to develop a Learning Management System (LMS) application for online education.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Team Members:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '- John Doe\n- Jane Smith\n- Michael Johnson',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        // Add more details or widgets as needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}