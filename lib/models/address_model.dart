import 'dart:convert';

import 'city_model.dart';
import 'phone_model.dart';

class AddressModel {
  final String street;
  final int number;
  final String zipCode;
  final CityModel city;
  final PhoneModel phone;

  AddressModel({
    required this.street,
    required this.number,
    required this.zipCode,
    required this.city,
    required this.phone,
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      street: map['street'] ?? '',
      number: map['number'] ?? 0,
      zipCode: map['zipCode'] ?? '',
      city: CityModel.fromMap(map['city'] ?? <String, dynamic>{}),
      phone: PhoneModel.fromMap(map['phone'] ?? <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'number': number,
      'zipCode': zipCode,
      'city': city.toMap(),
      'phone': phone.toMap()
    };
  }

  String toJson() => jsonEncode(toMap());

  factory AddressModel.fromJson(String json) =>
      AddressModel.fromMap(jsonDecode(json));
}
