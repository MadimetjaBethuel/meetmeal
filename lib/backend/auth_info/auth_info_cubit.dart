import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetmeal/backend/auth_info/auth_info_repo.dart';
import 'package:meetmeal/models/User.dart';

abstract class SaveUserInfoState {}

class Saveinfo extends SaveUserInfoState {}

class SaveUserInfoCubit extends Cubit<SaveUserInfoState> {
  final _saveInfo = AuthInfoRepository();
  String userId;

  SaveUserInfoCubit({this.userId}) : super(Saveinfo());

  void saveGenderandAge(String gender, int age, String datingPreference) async {
    userId = await _saveInfo.getUserIdFromAttributes();
    await _saveInfo.saveAgeandGender(gender, age, datingPreference, userId);
  }

  void savedatingPrefernce(String datingPreferences) async {
    await _saveInfo.savedatingPreferences(datingPreferences, userId);
  }

  void updateInfo(User user, int age) async {
    await _saveInfo.upadateInfo(user, age);
  }
}
