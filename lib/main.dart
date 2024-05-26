
import 'package:flutter/material.dart';
import 'package:scheme_of_study_management/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
    options: const FirebaseOptions(
    apiKey: 'AIzaSyD5HffoSlYM00oeix0-WL034sM-FZvnP5Q',
    appId: '1:704363739996:android:a1cc40d8051cbba9631f99',
    messagingSenderId: '704363739996',
    projectId: 'trying-again-18821',
  ),
    );
    runApp(const MyApp());
  } catch (e) {
    runApp(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Failed to initialize Firebase: $e'),
        ),
      ),
    ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integrated Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
