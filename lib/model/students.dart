import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Studentsmodel {
  final String email;
  final String sub;
  Studentsmodel({
    required this.email,
    required this.sub,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'sub': sub,
    };
  }

  factory Studentsmodel.fromMap(Map<String, dynamic> map) {
    return Studentsmodel(
      email: map['email'] as String,
      sub: map['sub'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Studentsmodel.fromJson(String source) => Studentsmodel.fromMap(json.decode(source) as Map<String, dynamic>);
}
