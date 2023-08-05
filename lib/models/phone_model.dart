import 'dart:convert';

class PhoneModel {
  final int ddd;
  final String phone;

  PhoneModel({
    required this.ddd,
    required this.phone,
  });

  factory PhoneModel.fromMap(Map<String, dynamic> map) {
    return PhoneModel(
      ddd: map['ddd'] ?? 0,
      phone: map['phone'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'phone': phone,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory PhoneModel.fromJson(String json) =>
      PhoneModel.fromMap(jsonDecode(json));
}
