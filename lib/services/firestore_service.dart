import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scheme_of_study_management/models/student.dart';
import 'package:scheme_of_study_management/models/teacher.dart';

class FireService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addStudent(Student student) async {
    await _firestore.collection('students').add(student.toMap());
  }

  Future<List<Student>> fetchStudents() async {
    QuerySnapshot snapshot = await _firestore.collection('students').get();
    return snapshot.docs.map((doc) => Student.fromMap(doc.data() as Map<String, dynamic>)).toList();
  }

  Future<void> addTeacher(Teacher teacher) async {
    await _firestore.collection('teachers').add(teacher.toMap());
  }

  Future<List<Teacher>> fetchTeachers() async {
    QuerySnapshot snapshot = await _firestore.collection('teachers').get();
    return snapshot.docs.map((doc) => Teacher.fromMap(doc.data() as Map<String, dynamic>)).toList();
  }
}
