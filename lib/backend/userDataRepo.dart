import 'package:amplify_flutter/amplify.dart';
import 'package:meetmeal/models/ModelProvider.dart';

class UserDataRepository {
  Future<void> createUserData(
      String gender, int age, String datingPreference) async {
    final newUserData = UserData(
        UserAge: age, DatingPreference: datingPreference, Gender: gender);
    try {
      await Amplify.DataStore.save(newUserData);
    } catch (e) {
      throw e;
    }
  }
}
