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

/** This is an auto generated class representing the FoodPreference type in your schema. */
@immutable
class FoodPreference extends Model {
  static const classType = const _FoodPreferenceModelType();
  final String id;
  final String foodPreference;
  final String userID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const FoodPreference._internal(
      {@required this.id, this.foodPreference, this.userID});

  factory FoodPreference({String id, String foodPreference, String userID}) {
    return FoodPreference._internal(
        id: id == null ? UUID.getUUID() : id,
        foodPreference: foodPreference,
        userID: userID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodPreference &&
        id == other.id &&
        foodPreference == other.foodPreference &&
        userID == other.userID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("FoodPreference {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("foodPreference=" + "$foodPreference" + ", ");
    buffer.write("userID=" + "$userID");
    buffer.write("}");

    return buffer.toString();
  }

  FoodPreference copyWith({String id, String foodPreference, String userID}) {
    return FoodPreference(
        id: id ?? this.id,
        foodPreference: foodPreference ?? this.foodPreference,
        userID: userID ?? this.userID);
  }

  FoodPreference.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        foodPreference = json['foodPreference'],
        userID = json['userID'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'foodPreference': foodPreference, 'userID': userID};

  static final QueryField ID = QueryField(fieldName: "foodPreference.id");
  static final QueryField FOODPREFERENCE =
      QueryField(fieldName: "foodPreference");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "FoodPreference";
    modelSchemaDefinition.pluralName = "FoodPreferences";

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
        key: FoodPreference.FOODPREFERENCE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: FoodPreference.USERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _FoodPreferenceModelType extends ModelType<FoodPreference> {
  const _FoodPreferenceModelType();

  @override
  FoodPreference fromJson(Map<String, dynamic> jsonData) {
    return FoodPreference.fromJson(jsonData);
  }
}
