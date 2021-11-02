abstract class ProfileEvent {}

class ProfileAgeChange extends ProfileEvent {
  final int age;
  ProfileAgeChange({this.age});
}

class ProfileGenderChanges extends ProfileEvent {
  final String gender;

  ProfileGenderChanges({this.gender});
}

class ProfileDatingPreference extends ProfileEvent {
  final String datingPreference;
  ProfileDatingPreference({this.datingPreference});
}

class SaveProfileChanges extends ProfileEvent {}
