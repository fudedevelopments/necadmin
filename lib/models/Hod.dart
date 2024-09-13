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


/** This is an auto generated class representing the Hod type in your schema. */
class Hod extends amplify_core.Model {
  static const classType = const _HodModelType();
  final String id;
  final String? _hodname;
  final String? _email;
  final ClassRoom? _classRoom;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  HodModelIdentifier get modelIdentifier {
      return HodModelIdentifier(
        id: id
      );
  }
  
  String? get hodname {
    return _hodname;
  }
  
  String? get email {
    return _email;
  }
  
  ClassRoom? get classRoom {
    return _classRoom;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Hod._internal({required this.id, hodname, email, classRoom, createdAt, updatedAt}): _hodname = hodname, _email = email, _classRoom = classRoom, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Hod({String? id, String? hodname, String? email, ClassRoom? classRoom}) {
    return Hod._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      hodname: hodname,
      email: email,
      classRoom: classRoom);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Hod &&
      id == other.id &&
      _hodname == other._hodname &&
      _email == other._email &&
      _classRoom == other._classRoom;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Hod {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("hodname=" + "$_hodname" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("classRoom=" + (_classRoom != null ? _classRoom!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Hod copyWith({String? hodname, String? email, ClassRoom? classRoom}) {
    return Hod._internal(
      id: id,
      hodname: hodname ?? this.hodname,
      email: email ?? this.email,
      classRoom: classRoom ?? this.classRoom);
  }
  
  Hod copyWithModelFieldValues({
    ModelFieldValue<String?>? hodname,
    ModelFieldValue<String?>? email,
    ModelFieldValue<ClassRoom?>? classRoom
  }) {
    return Hod._internal(
      id: id,
      hodname: hodname == null ? this.hodname : hodname.value,
      email: email == null ? this.email : email.value,
      classRoom: classRoom == null ? this.classRoom : classRoom.value
    );
  }
  
  Hod.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _hodname = json['hodname'],
      _email = json['email'],
      _classRoom = json['classRoom'] != null
        ? json['classRoom']['serializedData'] != null
          ? ClassRoom.fromJson(new Map<String, dynamic>.from(json['classRoom']['serializedData']))
          : ClassRoom.fromJson(new Map<String, dynamic>.from(json['classRoom']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'hodname': _hodname, 'email': _email, 'classRoom': _classRoom?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'hodname': _hodname,
    'email': _email,
    'classRoom': _classRoom,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<HodModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<HodModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final HODNAME = amplify_core.QueryField(fieldName: "hodname");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final CLASSROOM = amplify_core.QueryField(
    fieldName: "classRoom",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'ClassRoom'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Hod";
    modelSchemaDefinition.pluralName = "Hods";
    
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
      key: Hod.HODNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Hod.EMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Hod.CLASSROOM,
      isRequired: false,
      targetNames: ['classRoomid'],
      ofModelName: 'ClassRoom'
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

class _HodModelType extends amplify_core.ModelType<Hod> {
  const _HodModelType();
  
  @override
  Hod fromJson(Map<String, dynamic> jsonData) {
    return Hod.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Hod';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Hod] in your schema.
 */
class HodModelIdentifier implements amplify_core.ModelIdentifier<Hod> {
  final String id;

  /** Create an instance of HodModelIdentifier using [id] the primary key. */
  const HodModelIdentifier({
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
  String toString() => 'HodModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is HodModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}