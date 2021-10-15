import 'package:amplify_flutter/amplify.dart';
import 'package:meetmeal/models/UserData.dart';

class CreateUserRepository {
  Future<void> createUserGenderAge(
    String gender,
    int age,
  ) async {
    final newUserGenderAge = UserData(
      Gender: gender,
      UserAge: age,
    );

    try {
      await Amplify.DataStore.save(newUserGenderAge);
    } catch (e) {
      throw e;
    }
  }

  Future<void> datingPreference(
    String datingPreference,
  ) async {
    final newUserDatingPrefence = UserData(
      DatingPreference: datingPreference,
    );

    try {
      await Amplify.DataStore.save(newUserDatingPrefence);
    } catch (e) {
      throw e;
    }
  }
}
