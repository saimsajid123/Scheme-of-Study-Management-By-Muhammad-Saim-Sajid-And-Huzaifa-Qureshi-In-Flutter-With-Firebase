class Student {
  final String name;
  final String cgpa;

  Student({
    required this.name,
    required this.cgpa,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cgpa': cgpa,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'],
      cgpa: map['cgpa'],
    );
  }
}
