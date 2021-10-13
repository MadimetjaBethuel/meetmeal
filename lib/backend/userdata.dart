import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetmeal/backend/userDataRepo.dart';

abstract class UserDataState {}

class CreatingData extends UserDataState {}

class SaveUserData extends Cubit<UserDataState> {
  final newuser = UserDataRepository();
  SaveUserData() : super(CreatingData());

  void createData(String gender, String datingPreference, int age) async {
    await newuser.createUserData(gender, age, datingPreference);
  }
}
