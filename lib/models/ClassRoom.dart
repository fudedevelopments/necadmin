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


/** This is an auto generated class representing the ClassRoom type in your schema. */
class ClassRoom extends amplify_core.Model {
  static const classType = const _ClassRoomModelType();
  final String id;
  final String? _classRoomname;
  final List<Hod>? _hod;
  final List<Ac>? _ac;
  final List<Proctor>? _proctors;
  final List<Student>? _students;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ClassRoomModelIdentifier get modelIdentifier {
      return ClassRoomModelIdentifier(
        id: id
      );
  }
  
  String? get classRoomname {
    return _classRoomname;
  }
  
  List<Hod>? get hod {
    return _hod;
  }
  
  List<Ac>? get ac {
    return _ac;
  }
  
  List<Proctor>? get proctors {
    return _proctors;
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
  
  const ClassRoom._internal({required this.id, classRoomname, hod, ac, proctors, students, createdAt, updatedAt}): _classRoomname = classRoomname, _hod = hod, _ac = ac, _proctors = proctors, _students = students, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ClassRoom({String? id, String? classRoomname, List<Hod>? hod, List<Ac>? ac, List<Proctor>? proctors, List<Student>? students}) {
    return ClassRoom._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      classRoomname: classRoomname,
      hod: hod != null ? List<Hod>.unmodifiable(hod) : hod,
      ac: ac != null ? List<Ac>.unmodifiable(ac) : ac,
      proctors: proctors != null ? List<Proctor>.unmodifiable(proctors) : proctors,
      students: students != null ? List<Student>.unmodifiable(students) : students);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClassRoom &&
      id == other.id &&
      _classRoomname == other._classRoomname &&
      DeepCollectionEquality().equals(_hod, other._hod) &&
      DeepCollectionEquality().equals(_ac, other._ac) &&
      DeepCollectionEquality().equals(_proctors, other._proctors) &&
      DeepCollectionEquality().equals(_students, other._students);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ClassRoom {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("classRoomname=" + "$_classRoomname" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ClassRoom copyWith({String? classRoomname, List<Hod>? hod, List<Ac>? ac, List<Proctor>? proctors, List<Student>? students}) {
    return ClassRoom._internal(
      id: id,
      classRoomname: classRoomname ?? this.classRoomname,
      hod: hod ?? this.hod,
      ac: ac ?? this.ac,
      proctors: proctors ?? this.proctors,
      students: students ?? this.students);
  }
  
  ClassRoom copyWithModelFieldValues({
    ModelFieldValue<String?>? classRoomname,
    ModelFieldValue<List<Hod>?>? hod,
    ModelFieldValue<List<Ac>?>? ac,
    ModelFieldValue<List<Proctor>?>? proctors,
    ModelFieldValue<List<Student>?>? students
  }) {
    return ClassRoom._internal(
      id: id,
      classRoomname: classRoomname == null ? this.classRoomname : classRoomname.value,
      hod: hod == null ? this.hod : hod.value,
      ac: ac == null ? this.ac : ac.value,
      proctors: proctors == null ? this.proctors : proctors.value,
      students: students == null ? this.students : students.value
    );
  }
  
  ClassRoom.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _classRoomname = json['classRoomname'],
      _hod = json['hod']  is Map
        ? (json['hod']['items'] is List
          ? (json['hod']['items'] as List)
              .where((e) => e != null)
              .map((e) => Hod.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['hod'] is List
          ? (json['hod'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Hod.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _ac = json['ac']  is Map
        ? (json['ac']['items'] is List
          ? (json['ac']['items'] as List)
              .where((e) => e != null)
              .map((e) => Ac.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['ac'] is List
          ? (json['ac'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Ac.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _proctors = json['proctors']  is Map
        ? (json['proctors']['items'] is List
          ? (json['proctors']['items'] as List)
              .where((e) => e != null)
              .map((e) => Proctor.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['proctors'] is List
          ? (json['proctors'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Proctor.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
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
    'id': id, 'classRoomname': _classRoomname, 'hod': _hod?.map((Hod? e) => e?.toJson()).toList(), 'ac': _ac?.map((Ac? e) => e?.toJson()).toList(), 'proctors': _proctors?.map((Proctor? e) => e?.toJson()).toList(), 'students': _students?.map((Student? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'classRoomname': _classRoomname,
    'hod': _hod,
    'ac': _ac,
    'proctors': _proctors,
    'students': _students,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ClassRoomModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ClassRoomModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CLASSROOMNAME = amplify_core.QueryField(fieldName: "classRoomname");
  static final HOD = amplify_core.QueryField(
    fieldName: "hod",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Hod'));
  static final AC = amplify_core.QueryField(
    fieldName: "ac",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Ac'));
  static final PROCTORS = amplify_core.QueryField(
    fieldName: "proctors",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Proctor'));
  static final STUDENTS = amplify_core.QueryField(
    fieldName: "students",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Student'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ClassRoom";
    modelSchemaDefinition.pluralName = "ClassRooms";
    
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
      key: ClassRoom.CLASSROOMNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: ClassRoom.HOD,
      isRequired: false,
      ofModelName: 'Hod',
      associatedKey: Hod.CLASSROOM
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: ClassRoom.AC,
      isRequired: false,
      ofModelName: 'Ac',
      associatedKey: Ac.CLASSROOM
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: ClassRoom.PROCTORS,
      isRequired: false,
      ofModelName: 'Proctor',
      associatedKey: Proctor.CLASSROOM
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: ClassRoom.STUDENTS,
      isRequired: false,
      ofModelName: 'Student',
      associatedKey: Student.CLASSROOM
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

class _ClassRoomModelType extends amplify_core.ModelType<ClassRoom> {
  const _ClassRoomModelType();
  
  @override
  ClassRoom fromJson(Map<String, dynamic> jsonData) {
    return ClassRoom.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ClassRoom';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ClassRoom] in your schema.
 */
class ClassRoomModelIdentifier implements amplify_core.ModelIdentifier<ClassRoom> {
  final String id;

  /** Create an instance of ClassRoomModelIdentifier using [id] the primary key. */
  const ClassRoomModelIdentifier({
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
  String toString() => 'ClassRoomModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ClassRoomModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}