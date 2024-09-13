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


/** This is an auto generated class representing the Ac type in your schema. */
class Ac extends amplify_core.Model {
  static const classType = const _AcModelType();
  final String id;
  final String? _acname;
  final String? _email;
  final ClassRoom? _classRoom;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  AcModelIdentifier get modelIdentifier {
      return AcModelIdentifier(
        id: id
      );
  }
  
  String? get acname {
    return _acname;
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
  
  const Ac._internal({required this.id, acname, email, classRoom, createdAt, updatedAt}): _acname = acname, _email = email, _classRoom = classRoom, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Ac({String? id, String? acname, String? email, ClassRoom? classRoom}) {
    return Ac._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      acname: acname,
      email: email,
      classRoom: classRoom);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Ac &&
      id == other.id &&
      _acname == other._acname &&
      _email == other._email &&
      _classRoom == other._classRoom;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Ac {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("acname=" + "$_acname" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("classRoom=" + (_classRoom != null ? _classRoom!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Ac copyWith({String? acname, String? email, ClassRoom? classRoom}) {
    return Ac._internal(
      id: id,
      acname: acname ?? this.acname,
      email: email ?? this.email,
      classRoom: classRoom ?? this.classRoom);
  }
  
  Ac copyWithModelFieldValues({
    ModelFieldValue<String?>? acname,
    ModelFieldValue<String?>? email,
    ModelFieldValue<ClassRoom?>? classRoom
  }) {
    return Ac._internal(
      id: id,
      acname: acname == null ? this.acname : acname.value,
      email: email == null ? this.email : email.value,
      classRoom: classRoom == null ? this.classRoom : classRoom.value
    );
  }
  
  Ac.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _acname = json['acname'],
      _email = json['email'],
      _classRoom = json['classRoom'] != null
        ? json['classRoom']['serializedData'] != null
          ? ClassRoom.fromJson(new Map<String, dynamic>.from(json['classRoom']['serializedData']))
          : ClassRoom.fromJson(new Map<String, dynamic>.from(json['classRoom']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'acname': _acname, 'email': _email, 'classRoom': _classRoom?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'acname': _acname,
    'email': _email,
    'classRoom': _classRoom,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<AcModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<AcModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final ACNAME = amplify_core.QueryField(fieldName: "acname");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final CLASSROOM = amplify_core.QueryField(
    fieldName: "classRoom",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'ClassRoom'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Ac";
    modelSchemaDefinition.pluralName = "Acs";
    
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
      key: Ac.ACNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ac.EMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Ac.CLASSROOM,
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

class _AcModelType extends amplify_core.ModelType<Ac> {
  const _AcModelType();
  
  @override
  Ac fromJson(Map<String, dynamic> jsonData) {
    return Ac.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Ac';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Ac] in your schema.
 */
class AcModelIdentifier implements amplify_core.ModelIdentifier<Ac> {
  final String id;

  /** Create an instance of AcModelIdentifier using [id] the primary key. */
  const AcModelIdentifier({
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
  String toString() => 'AcModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is AcModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}