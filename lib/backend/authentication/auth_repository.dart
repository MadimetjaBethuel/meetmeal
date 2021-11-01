import 'package:amplify_flutter/amplify.dart';

class AuthRepository {
  Future<String> getUserIdFromAttributes() async {
    final attributes = await Amplify.Auth.fetchUserAttributes();
    final subAttributes =
        attributes.firstWhere((element) => element.userAttributeKey == 'sub');
    final userId = subAttributes.value();

    return userId;
  }

  Future<String> webSignin() async {
    try {
      final result = await Amplify.Auth.signInWithWebUI();

      if (result.isSignedIn) {
        //get user id
        return await getUserIdFromAttributes();
      } else {
        throw Exception('Could not sign in');
      }
    } catch (e) {
      throw e;
    }

    //sign out
  }

  Future<void> signOut() async {
    try {
      await Amplify.Auth.signOut();
    } catch (e) {
      throw e;
    }
  }

  //auto sign in

  Future<String> autoSignin() async {
    try {
      return await getUserIdFromAttributes();
    } catch (e) {
      throw e;
    }
  }
}
