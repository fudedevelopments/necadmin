import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StaffModel {
  final String email;
  final String sub;
  StaffModel({
    required this.email,
    required this.sub,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'sub': sub,
    };
  }

  factory StaffModel.fromMap(Map<String, dynamic> map) {
    return StaffModel(
      email: map['email'] as String,
      sub: map['sub'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StaffModel.fromJson(String source) => StaffModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
