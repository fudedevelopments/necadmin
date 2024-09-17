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


/** This is an auto generated class representing the Ondutyrequest type in your schema. */
class Ondutyrequest extends amplify_core.Model {
  static const classType = const _OndutyrequestModelType();
  final String id;
  final String? _ondutyname;
  final String? _email;
  final EventDetatils? _events;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  OndutyrequestModelIdentifier get modelIdentifier {
      return OndutyrequestModelIdentifier(
        id: id
      );
  }
  
  String? get ondutyname {
    return _ondutyname;
  }
  
  String? get email {
    return _email;
  }
  
  EventDetatils? get events {
    return _events;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Ondutyrequest._internal({required this.id, ondutyname, email, events, createdAt, updatedAt}): _ondutyname = ondutyname, _email = email, _events = events, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Ondutyrequest({String? id, String? ondutyname, String? email, EventDetatils? events}) {
    return Ondutyrequest._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      ondutyname: ondutyname,
      email: email,
      events: events);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Ondutyrequest &&
      id == other.id &&
      _ondutyname == other._ondutyname &&
      _email == other._email &&
      _events == other._events;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Ondutyrequest {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("ondutyname=" + "$_ondutyname" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("events=" + (_events != null ? _events!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Ondutyrequest copyWith({String? ondutyname, String? email, EventDetatils? events}) {
    return Ondutyrequest._internal(
      id: id,
      ondutyname: ondutyname ?? this.ondutyname,
      email: email ?? this.email,
      events: events ?? this.events);
  }
  
  Ondutyrequest copyWithModelFieldValues({
    ModelFieldValue<String?>? ondutyname,
    ModelFieldValue<String?>? email,
    ModelFieldValue<EventDetatils?>? events
  }) {
    return Ondutyrequest._internal(
      id: id,
      ondutyname: ondutyname == null ? this.ondutyname : ondutyname.value,
      email: email == null ? this.email : email.value,
      events: events == null ? this.events : events.value
    );
  }
  
  Ondutyrequest.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _ondutyname = json['ondutyname'],
      _email = json['email'],
      _events = json['events'] != null
        ? json['events']['serializedData'] != null
          ? EventDetatils.fromJson(new Map<String, dynamic>.from(json['events']['serializedData']))
          : EventDetatils.fromJson(new Map<String, dynamic>.from(json['events']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'ondutyname': _ondutyname, 'email': _email, 'events': _events?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'ondutyname': _ondutyname,
    'email': _email,
    'events': _events,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<OndutyrequestModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<OndutyrequestModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final ONDUTYNAME = amplify_core.QueryField(fieldName: "ondutyname");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final EVENTS = amplify_core.QueryField(
    fieldName: "events",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'EventDetatils'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Ondutyrequest";
    modelSchemaDefinition.pluralName = "Ondutyrequests";
    
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
      key: Ondutyrequest.ONDUTYNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Ondutyrequest.EMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Ondutyrequest.EVENTS,
      isRequired: false,
      targetNames: ['eventid'],
      ofModelName: 'EventDetatils'
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

class _OndutyrequestModelType extends amplify_core.ModelType<Ondutyrequest> {
  const _OndutyrequestModelType();
  
  @override
  Ondutyrequest fromJson(Map<String, dynamic> jsonData) {
    return Ondutyrequest.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Ondutyrequest';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Ondutyrequest] in your schema.
 */
class OndutyrequestModelIdentifier implements amplify_core.ModelIdentifier<Ondutyrequest> {
  final String id;

  /** Create an instance of OndutyrequestModelIdentifier using [id] the primary key. */
  const OndutyrequestModelIdentifier({
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
  String toString() => 'OndutyrequestModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is OndutyrequestModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}