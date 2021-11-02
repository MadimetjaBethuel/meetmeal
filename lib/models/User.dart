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

/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final int age;
  final String datingPreference;
  final String gender;
  final String email;
  final String description;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const User._internal(
      {@required this.id,
      this.age,
      this.datingPreference,
      this.gender,
      this.email,
      this.description});

  factory User(
      {String id,
      int age,
      String datingPreference,
      String gender,
      String email,
      String description}) {
    return User._internal(
        id: id == null ? UUID.getUUID() : id,
        age: age,
        datingPreference: datingPreference,
        gender: gender,
        email: email,
        description: description);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        age == other.age &&
        datingPreference == other.datingPreference &&
        gender == other.gender &&
        email == other.email &&
        description == other.description;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("age=" + (age != null ? age.toString() : "null") + ", ");
    buffer.write("datingPreference=" + "$datingPreference" + ", ");
    buffer.write("gender=" + "$gender" + ", ");
    buffer.write("email=" + "$email" + ", ");
    buffer.write("description=" + "$description");
    buffer.write("}");

    return buffer.toString();
  }

  User copyWith(
      {String id,
      int age,
      String datingPreference,
      String gender,
      String email,
      String description}) {
    return User(
        id: id ?? this.id,
        age: age ?? this.age,
        datingPreference: datingPreference ?? this.datingPreference,
        gender: gender ?? this.gender,
        email: email ?? this.email,
        description: description ?? this.description);
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        age = json['age'],
        datingPreference = json['datingPreference'],
        gender = json['gender'],
        email = json['email'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'age': age,
        'datingPreference': datingPreference,
        'gender': gender,
        'email': email,
        'description': description
      };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField AGE = QueryField(fieldName: "age");
  static final QueryField DATINGPREFERENCE =
      QueryField(fieldName: "datingPreference");
  static final QueryField GENDER = QueryField(fieldName: "gender");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";

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
        key: User.AGE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.DATINGPREFERENCE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.GENDER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.EMAIL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.DESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();

  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}
