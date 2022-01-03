import 'dart:convert';

class UserModel {
  final String name;
  final String number;
  final String emailAddress;

  UserModel(this.name, this.number, this.emailAddress);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
      'emailAddress': emailAddress,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['name'] ?? '',
      map['number'] ?? '',
      map['emailAddress'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
