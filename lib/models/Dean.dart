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


/** This is an auto generated class representing the Dean type in your schema. */
class Dean extends amplify_core.Model {
  static const classType = const _DeanModelType();
  final String id;
  final String? _deanname;
  final String? _email;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  DeanModelIdentifier get modelIdentifier {
      return DeanModelIdentifier(
        id: id
      );
  }
  
  String? get deanname {
    return _deanname;
  }
  
  String? get email {
    return _email;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Dean._internal({required this.id, deanname, email, createdAt, updatedAt}): _deanname = deanname, _email = email, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Dean({String? id, String? deanname, String? email}) {
    return Dean._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      deanname: deanname,
      email: email);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Dean &&
      id == other.id &&
      _deanname == other._deanname &&
      _email == other._email;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Dean {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("deanname=" + "$_deanname" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Dean copyWith({String? deanname, String? email}) {
    return Dean._internal(
      id: id,
      deanname: deanname ?? this.deanname,
      email: email ?? this.email);
  }
  
  Dean copyWithModelFieldValues({
    ModelFieldValue<String?>? deanname,
    ModelFieldValue<String?>? email
  }) {
    return Dean._internal(
      id: id,
      deanname: deanname == null ? this.deanname : deanname.value,
      email: email == null ? this.email : email.value
    );
  }
  
  Dean.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _deanname = json['deanname'],
      _email = json['email'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'deanname': _deanname, 'email': _email, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'deanname': _deanname,
    'email': _email,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<DeanModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<DeanModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final DEANNAME = amplify_core.QueryField(fieldName: "deanname");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Dean";
    modelSchemaDefinition.pluralName = "Deans";
    
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
      key: Dean.DEANNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Dean.EMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
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

class _DeanModelType extends amplify_core.ModelType<Dean> {
  const _DeanModelType();
  
  @override
  Dean fromJson(Map<String, dynamic> jsonData) {
    return Dean.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Dean';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Dean] in your schema.
 */
class DeanModelIdentifier implements amplify_core.ModelIdentifier<Dean> {
  final String id;

  /** Create an instance of DeanModelIdentifier using [id] the primary key. */
  const DeanModelIdentifier({
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
  String toString() => 'DeanModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is DeanModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}