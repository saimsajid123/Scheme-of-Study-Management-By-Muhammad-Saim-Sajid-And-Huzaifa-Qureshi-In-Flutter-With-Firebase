//Name: Muhammad Saim Sajid
//Roll No: F21BSEEN1E02025
//Section: 6TH E1
//Name: Huzaifa Qureshi
//Roll No: F21BSEEN1E02022
//Section: 6THE1

//this is a project,i made with my fellow huzaifa,its a scheme of study management app that manages the teacher with courses and students,it uses firebase to autheticate the login
// we have my given own api here so you can use that,if that does not work then you can set up your project on fireabase console and then use your own api
//run "flutter pubget" to get all the depencies required 
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
