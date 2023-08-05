import 'dart:convert';

class CoursesModel {
  final int id;
  final String name;
  final bool isStudent;

  CoursesModel({
    required this.id,
    required this.name,
    required this.isStudent,
  });

  factory CoursesModel.fromMap(Map<String, dynamic> map) {
    return CoursesModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      isStudent: map['isStudent'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isStudent': isStudent,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory CoursesModel.fromJson(String json) =>
      CoursesModel.fromMap(jsonDecode(json));
}
