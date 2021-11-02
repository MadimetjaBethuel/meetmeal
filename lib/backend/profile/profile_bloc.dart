import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetmeal/backend/profile/profile_event.dart';
import 'package:meetmeal/backend/profile/profile_state.dart';
import 'package:meetmeal/models/User.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({@required User user, @required bool isCurrentUser})
      : super(ProfileState(
          user: user,
          isCurrentUser: isCurrentUser,
        ));
  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfileAgeChange) {
      yield state.copyWith(age: event.age);
    } else if (event is ProfileDatingPreference) {
      yield state.copyWith(datingPrefernce: event.datingPreference);
    } else if (event is ProfileGenderChanges) {
      yield state.copyWith(gender: event.gender);
    } else if (event is SaveProfileChanges) {}
  }
}
