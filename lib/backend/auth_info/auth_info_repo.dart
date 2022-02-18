import 'package:amplify_flutter/amplify.dart';
import 'package:meetmeal/models/User.dart';

class AuthInfoRepository {
  Future<String> getUserIdFromAttributes() async {
    try {
      final attributes = await Amplify.Auth.fetchUserAttributes();
      final userId = attributes
          .firstWhere((element) => element.userAttributeKey == "sub")
          .value;
      return userId;
    } catch (e) {
      throw e;
    }
  }

  Future<void> saveAgeandGender(
    String gender,
    int age,
    String datingPreference,
    String userId,
  ) async {
    final newAgeandGender = User(
      gender: gender,
      age: age,
      datingPreference: datingPreference,
      id: userId,
    );
    try {
      userId = getUserIdFromAttributes().toString();
      await Amplify.DataStore.save(newAgeandGender);
    } catch (e) {
      throw e;
    }
  }

  Future<void> savedatingPreferences(
    String datingPreferences,
    String userId,
  ) async {
    final datingPreference = User(
      datingPreference: datingPreferences,
      id: userId,
    );

    try {
      userId = getUserIdFromAttributes().toString();
      await Amplify.DataStore.save(datingPreference);
    } catch (e) {
      throw e;
    }
  }

  Future upadateInfo(User user, int age) async {
    final updateUserinfo = user.copyWith(age: age);

    try {
      await Amplify.DataStore.save(updateUserinfo);
    } catch (e) {
      throw e;
    }
  }
}
