/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Proctor type in your schema. */
class Proctor extends amplify_core.Model {
  static const classType = const _ProctorModelType();
  final String id;
  final String? _proctorname;
  final String? _email;
  final ClassRoom? _classRoom;
  final List<Student>? _students;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ProctorModelIdentifier get modelIdentifier {
      return ProctorModelIdentifier(
        id: id
      );
  }
  
  String? get proctorname {
    return _proctorname;
  }
  
  String? get email {
    return _email;
  }
  
  ClassRoom? get classRoom {
    return _classRoom;
  }
  
  List<Student>? get students {
    return _students;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Proctor._internal({required this.id, proctorname, email, classRoom, students, createdAt, updatedAt}): _proctorname = proctorname, _email = email, _classRoom = classRoom, _students = students, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Proctor({String? id, String? proctorname, String? email, ClassRoom? classRoom, List<Student>? students}) {
    return Proctor._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      proctorname: proctorname,
      email: email,
      classRoom: classRoom,
      students: students != null ? List<Student>.unmodifiable(students) : students);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Proctor &&
      id == other.id &&
      _proctorname == other._proctorname &&
      _email == other._email &&
      _classRoom == other._classRoom &&
      DeepCollectionEquality().equals(_students, other._students);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Proctor {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("proctorname=" + "$_proctorname" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("classRoom=" + (_classRoom != null ? _classRoom!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Proctor copyWith({String? proctorname, String? email, ClassRoom? classRoom, List<Student>? students}) {
    return Proctor._internal(
      id: id,
      proctorname: proctorname ?? this.proctorname,
      email: email ?? this.email,
      classRoom: classRoom ?? this.classRoom,
      students: students ?? this.students);
  }
  
  Proctor copyWithModelFieldValues({
    ModelFieldValue<String?>? proctorname,
    ModelFieldValue<String?>? email,
    ModelFieldValue<ClassRoom?>? classRoom,
    ModelFieldValue<List<Student>?>? students
  }) {
    return Proctor._internal(
      id: id,
      proctorname: proctorname == null ? this.proctorname : proctorname.value,
      email: email == null ? this.email : email.value,
      classRoom: classRoom == null ? this.classRoom : classRoom.value,
      students: students == null ? this.students : students.value
    );
  }
  
  Proctor.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _proctorname = json['proctorname'],
      _email = json['email'],
      _classRoom = json['classRoom'] != null
        ? json['classRoom']['serializedData'] != null
          ? ClassRoom.fromJson(new Map<String, dynamic>.from(json['classRoom']['serializedData']))
          : ClassRoom.fromJson(new Map<String, dynamic>.from(json['classRoom']))
        : null,
      _students = json['students']  is Map
        ? (json['students']['items'] is List
          ? (json['students']['items'] as List)
              .where((e) => e != null)
              .map((e) => Student.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['students'] is List
          ? (json['students'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Student.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'proctorname': _proctorname, 'email': _email, 'classRoom': _classRoom?.toJson(), 'students': _students?.map((Student? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'proctorname': _proctorname,
    'email': _email,
    'classRoom': _classRoom,
    'students': _students,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ProctorModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ProctorModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final PROCTORNAME = amplify_core.QueryField(fieldName: "proctorname");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final CLASSROOM = amplify_core.QueryField(
    fieldName: "classRoom",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'ClassRoom'));
  static final STUDENTS = amplify_core.QueryField(
    fieldName: "students",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Student'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Proctor";
    modelSchemaDefinition.pluralName = "Proctors";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "ADMINS", "STAFF" ],
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Proctor.PROCTORNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Proctor.EMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Proctor.CLASSROOM,
      isRequired: false,
      targetNames: ['classRoomid'],
      ofModelName: 'ClassRoom'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Proctor.STUDENTS,
      isRequired: false,
      ofModelName: 'Student',
      associatedKey: Student.PROCTOR
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ProctorModelType extends amplify_core.ModelType<Proctor> {
  const _ProctorModelType();
  
  @override
  Proctor fromJson(Map<String, dynamic> jsonData) {
    return Proctor.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Proctor';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Proctor] in your schema.
 */
class ProctorModelIdentifier implements amplify_core.ModelIdentifier<Proctor> {
  final String id;

  /** Create an instance of ProctorModelIdentifier using [id] the primary key. */
  const ProctorModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'ProctorModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ProctorModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}