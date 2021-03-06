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

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the UserData type in your schema. */
@immutable
class UserData extends Model {
  static const classType = const _UserDataModelType();
  final String id;
  final int UserAge;
  final String DatingPreference;
  final String Gender;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const UserData._internal(
      {@required this.id, this.UserAge, this.DatingPreference, this.Gender});

  factory UserData(
      {String id, int UserAge, String DatingPreference, String Gender}) {
    return UserData._internal(
        id: id == null ? UUID.getUUID() : id,
        UserAge: UserAge,
        DatingPreference: DatingPreference,
        Gender: Gender);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserData &&
        id == other.id &&
        UserAge == other.UserAge &&
        DatingPreference == other.DatingPreference &&
        Gender == other.Gender;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("UserData {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write(
        "UserAge=" + (UserAge != null ? UserAge.toString() : "null") + ", ");
    buffer.write("DatingPreference=" + "$DatingPreference" + ", ");
    buffer.write("Gender=" + "$Gender");
    buffer.write("}");

    return buffer.toString();
  }

  UserData copyWith(
      {String id, int UserAge, String DatingPreference, String Gender}) {
    return UserData(
        id: id ?? this.id,
        UserAge: UserAge ?? this.UserAge,
        DatingPreference: DatingPreference ?? this.DatingPreference,
        Gender: Gender ?? this.Gender);
  }

  UserData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        UserAge = json['UserAge'],
        DatingPreference = json['DatingPreference'],
        Gender = json['Gender'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'UserAge': UserAge,
        'DatingPreference': DatingPreference,
        'Gender': Gender
      };

  static final QueryField ID = QueryField(fieldName: "userData.id");
  static final QueryField USERAGE = QueryField(fieldName: "UserAge");
  static final QueryField DATINGPREFERENCE =
      QueryField(fieldName: "DatingPreference");
  static final QueryField GENDER = QueryField(fieldName: "Gender");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserData";
    modelSchemaDefinition.pluralName = "UserData";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserData.USERAGE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserData.DATINGPREFERENCE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserData.GENDER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _UserDataModelType extends ModelType<UserData> {
  const _UserDataModelType();

  @override
  UserData fromJson(Map<String, dynamic> jsonData) {
    return UserData.fromJson(jsonData);
  }
}
