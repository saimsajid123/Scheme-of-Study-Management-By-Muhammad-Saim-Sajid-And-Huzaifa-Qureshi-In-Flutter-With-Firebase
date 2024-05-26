class Teacher {
  final String name;
  final String subject;
  final String courseHour;
  final String courseCode;

  Teacher({
    required this.name,
    required this.subject,
    required this.courseHour,
    required this.courseCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'subject': subject,
      'courseHour': courseHour,
      'courseCode': courseCode,
    };
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      name: map['name'],
      subject: map['subject'],
      courseHour: map['courseHour'],
      courseCode: map['courseCode'],
    );
  }
}
