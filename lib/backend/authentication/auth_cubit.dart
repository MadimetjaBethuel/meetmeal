import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetmeal/backend/authentication/auth_repository.dart';
import 'package:meetmeal/backend/authentication/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final authRepo = AuthRepository();
  AuthCubit() : super(unknownAuthState());

  void signIn() async {
    try {
      final userId = await authRepo.webSignin();
      if (userId != null && userId.isNotEmpty) {
        emit(Authnticated(userId: userId));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      throw e;
    }
  }

  void signOut() async {
    try {
      await authRepo.signOut();
    } on Exception {
      emit(Unauthenticated());
    }
  }

  void autoSignin() async {
    try {
      final userId = await authRepo.autoSignin();
      if (userId != null && userId.isNotEmpty) {
        emit(Authnticated(userId: userId));
      } else {
        emit(Unauthenticated());
      }
    } on Exception {
      emit(Unauthenticated());
    }
  }
}
