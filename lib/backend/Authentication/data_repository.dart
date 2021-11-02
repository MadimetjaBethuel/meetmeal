import 'package:amplify_flutter/amplify.dart';
import 'package:meetmeal/models/User.dart';

class DataRepository {
  Future<User> getUserbyId(String userId) async {
    try {
      final users = await Amplify.DataStore.query(
        User.classType,
        where: User.ID.eq(userId),
      );
      return users.isNotEmpty ? users.first : null;
    } catch (e) {
      throw e;
    }
  }

  Future<User> createUser({
    String userId,
    String email,
  }) async {
    final newUser = User(id: userId, email: email);

    try {
      await Amplify.DataStore.save(newUser);
    } catch (e) {
      throw e;
    }
  }
}
