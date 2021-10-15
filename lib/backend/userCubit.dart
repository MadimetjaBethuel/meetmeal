import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetmeal/backend/createuserepository.dart';

abstract class CreateUserState {}

class CreateUser extends CreateUserState {}

class CreateUserCubit extends Cubit<CreateUserState> {
  final _createUserRepo = CreateUserRepository();

  CreateUserCubit() : super(CreateUser());

  void saveGenderAgeData(int age, String gender) async {
    await _createUserRepo.createUserGenderAge(gender, age);
  }

  void saveDatingPreference(String datingPreference) async {
    await _createUserRepo.datingPreference(datingPreference);
  }
}
