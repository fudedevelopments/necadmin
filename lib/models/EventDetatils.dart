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


/** This is an auto generated class representing the EventDetatils type in your schema. */
class EventDetatils extends amplify_core.Model {
  static const classType = const _EventDetatilsModelType();
  final String id;
  final List<String>? _images;
  final String? _eventname;
  final String? _eventdetails;
  final String? _date;
  final String? _location;
  final String? _registerurl;
  final List<Ondutyrequest>? _ondutyrequest;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  EventDetatilsModelIdentifier get modelIdentifier {
      return EventDetatilsModelIdentifier(
        id: id
      );
  }
  
  List<String>? get images {
    return _images;
  }
  
  String? get eventname {
    return _eventname;
  }
  
  String? get eventdetails {
    return _eventdetails;
  }
  
  String? get date {
    return _date;
  }
  
  String? get location {
    return _location;
  }
  
  String? get registerurl {
    return _registerurl;
  }
  
  List<Ondutyrequest>? get ondutyrequest {
    return _ondutyrequest;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const EventDetatils._internal({required this.id, images, eventname, eventdetails, date, location, registerurl, ondutyrequest, createdAt, updatedAt}): _images = images, _eventname = eventname, _eventdetails = eventdetails, _date = date, _location = location, _registerurl = registerurl, _ondutyrequest = ondutyrequest, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory EventDetatils({String? id, List<String>? images, String? eventname, String? eventdetails, String? date, String? location, String? registerurl, List<Ondutyrequest>? ondutyrequest}) {
    return EventDetatils._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      images: images != null ? List<String>.unmodifiable(images) : images,
      eventname: eventname,
      eventdetails: eventdetails,
      date: date,
      location: location,
      registerurl: registerurl,
      ondutyrequest: ondutyrequest != null ? List<Ondutyrequest>.unmodifiable(ondutyrequest) : ondutyrequest);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventDetatils &&
      id == other.id &&
      DeepCollectionEquality().equals(_images, other._images) &&
      _eventname == other._eventname &&
      _eventdetails == other._eventdetails &&
      _date == other._date &&
      _location == other._location &&
      _registerurl == other._registerurl &&
      DeepCollectionEquality().equals(_ondutyrequest, other._ondutyrequest);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("EventDetatils {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("images=" + (_images != null ? _images!.toString() : "null") + ", ");
    buffer.write("eventname=" + "$_eventname" + ", ");
    buffer.write("eventdetails=" + "$_eventdetails" + ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("registerurl=" + "$_registerurl" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  EventDetatils copyWith({List<String>? images, String? eventname, String? eventdetails, String? date, String? location, String? registerurl, List<Ondutyrequest>? ondutyrequest}) {
    return EventDetatils._internal(
      id: id,
      images: images ?? this.images,
      eventname: eventname ?? this.eventname,
      eventdetails: eventdetails ?? this.eventdetails,
      date: date ?? this.date,
      location: location ?? this.location,
      registerurl: registerurl ?? this.registerurl,
      ondutyrequest: ondutyrequest ?? this.ondutyrequest);
  }
  
  EventDetatils copyWithModelFieldValues({
    ModelFieldValue<List<String>?>? images,
    ModelFieldValue<String?>? eventname,
    ModelFieldValue<String?>? eventdetails,
    ModelFieldValue<String?>? date,
    ModelFieldValue<String?>? location,
    ModelFieldValue<String?>? registerurl,
    ModelFieldValue<List<Ondutyrequest>?>? ondutyrequest
  }) {
    return EventDetatils._internal(
      id: id,
      images: images == null ? this.images : images.value,
      eventname: eventname == null ? this.eventname : eventname.value,
      eventdetails: eventdetails == null ? this.eventdetails : eventdetails.value,
      date: date == null ? this.date : date.value,
      location: location == null ? this.location : location.value,
      registerurl: registerurl == null ? this.registerurl : registerurl.value,
      ondutyrequest: ondutyrequest == null ? this.ondutyrequest : ondutyrequest.value
    );
  }
  
  EventDetatils.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _images = json['images']?.cast<String>(),
      _eventname = json['eventname'],
      _eventdetails = json['eventdetails'],
      _date = json['date'],
      _location = json['location'],
      _registerurl = json['registerurl'],
      _ondutyrequest = json['ondutyrequest']  is Map
        ? (json['ondutyrequest']['items'] is List
          ? (json['ondutyrequest']['items'] as List)
              .where((e) => e != null)
              .map((e) => Ondutyrequest.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['ondutyrequest'] is List
          ? (json['ondutyrequest'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Ondutyrequest.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'images': _images, 'eventname': _eventname, 'eventdetails': _eventdetails, 'date': _date, 'location': _location, 'registerurl': _registerurl, 'ondutyrequest': _ondutyrequest?.map((Ondutyrequest? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'images': _images,
    'eventname': _eventname,
    'eventdetails': _eventdetails,
    'date': _date,
    'location': _location,
    'registerurl': _registerurl,
    'ondutyrequest': _ondutyrequest,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<EventDetatilsModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<EventDetatilsModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final IMAGES = amplify_core.QueryField(fieldName: "images");
  static final EVENTNAME = amplify_core.QueryField(fieldName: "eventname");
  static final EVENTDETAILS = amplify_core.QueryField(fieldName: "eventdetails");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static final LOCATION = amplify_core.QueryField(fieldName: "location");
  static final REGISTERURL = amplify_core.QueryField(fieldName: "registerurl");
  static final ONDUTYREQUEST = amplify_core.QueryField(
    fieldName: "ondutyrequest",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Ondutyrequest'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "EventDetatils";
    modelSchemaDefinition.pluralName = "EventDetatils";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "STUDENTS" ],
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.READ
        ]),
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
      key: EventDetatils.IMAGES,
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EventDetatils.EVENTNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EventDetatils.EVENTDETAILS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EventDetatils.DATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EventDetatils.LOCATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: EventDetatils.REGISTERURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: EventDetatils.ONDUTYREQUEST,
      isRequired: false,
      ofModelName: 'Ondutyrequest',
      associatedKey: Ondutyrequest.EVENTS
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

class _EventDetatilsModelType extends amplify_core.ModelType<EventDetatils> {
  const _EventDetatilsModelType();
  
  @override
  EventDetatils fromJson(Map<String, dynamic> jsonData) {
    return EventDetatils.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'EventDetatils';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [EventDetatils] in your schema.
 */
class EventDetatilsModelIdentifier implements amplify_core.ModelIdentifier<EventDetatils> {
  final String id;

  /** Create an instance of EventDetatilsModelIdentifier using [id] the primary key. */
  const EventDetatilsModelIdentifier({
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
  String toString() => 'EventDetatilsModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is EventDetatilsModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}