import 'package:flutter/foundation.dart';
import 'package:meetmeal/backend/Authentication/form_submission_status.dart';
import 'package:meetmeal/models/User.dart';

class ProfileState {
  final User user;
  final bool isCurrentUser;
  final String datingPreference;
  final int age;
  final String gender;

  String get email => user.email;

  final FormSubmissionStatus formStatus;

  ProfileState({
    @required User user,
    @required bool isCurrentUser,
    int age,
    String gender,
    String datingPreference,
    this.formStatus = const InitialFormStatus(),
  })  : this.user = user,
        this.isCurrentUser = isCurrentUser,
        this.datingPreference = datingPreference,
        this.age = age,
        this.gender = gender;
  ProfileState copyWith({
    User user,
    String datingPrefernce,
    String gender,
    int age,
    FormSubmissionStatus formStatus,
  }) {
    return ProfileState(
      user: user ?? this.user,
      isCurrentUser: this.isCurrentUser,
      datingPreference: datingPreference ?? this.datingPreference,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
