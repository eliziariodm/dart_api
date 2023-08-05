import 'dart:convert';

import 'address_model.dart';
import 'courses_model.dart';

class StudentsModel {
  final int? id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<CoursesModel> courses;
  final AddressModel address;

  StudentsModel({
    this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });

  factory StudentsModel.fromMap(Map<String, dynamic> map) {
    return StudentsModel(
      id: map['id'],
      name: map['name'] ?? '',
      age: map['age'],
      nameCourses:
          // map['nameCourses'].cast<String>(),
          List<String>.from(map['nameCourses'] ?? <String>[]),
      courses:
          // map['courses']
          //         ?.map<CoursesModel>(
          //             (course) => CoursesModel.fromMap(course))
          //         .toList() ??
          //     <CoursesModel>[],
          List.from(
              map['courses'].map((course) => CoursesModel.fromMap(course)) ??
                  <CoursesModel>[]),
      address: AddressModel.fromMap(map['address'] ?? <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'name': name,
      'nameCourses': nameCourses,
      'courses': courses.map((course) => course.toMap()).toList(),
      //List.from(courses.map((course) => course.toMap())),
      'address': address.toMap(),
    };

    if (age != null) {
      map['age'] = age;
    }

    return map;
  }

  String toJson() => jsonEncode(toMap());

  factory StudentsModel.fromJson(String json) =>
      StudentsModel.fromMap(jsonDecode(json));
}
