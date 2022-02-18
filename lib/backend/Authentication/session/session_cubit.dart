import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetmeal/backend/Authentication/auth_credentials.dart';
import 'package:meetmeal/backend/Authentication/auth_repsository.dart';
import 'package:meetmeal/backend/Authentication/data_repository.dart';
import 'package:meetmeal/backend/Authentication/session/session_state.dart';
import 'package:meetmeal/models/User.dart';

class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRespository;
  final DataRepository dataRepository;

  User get currentUser => (state as Authenticated).user;
  User get selectedUser => (state as Authenticated).selectedUser;

  bool get isCurrentUserSelected =>
      selectedUser == null || currentUser.id == selectedUser.id;

  SessionCubit({
    @required this.authRespository,
    @required this.dataRepository,
  }) : super(UnknownSessionState()) {
    attemptAutoLogin();
  }

  void attemptAutoLogin() async {
    try {
      final userId = await authRespository.attemptingAutoLogin();
      if (userId == null) {
        throw Exception("user not logged in");
      }

      User user = await dataRepository.getUserbyId(userId);
      if (user == null) {
        user = await dataRepository.createUser(
          userId: userId,
          email: 'User-${UUID()}',
        );
      }
      emit(Authenticated(user: user));
    } on Exception {
      emit(Unauthenticated());
    }
  }

  void showAuth() => emit(Unauthenticated());
  void showSession(AuthCredentials credentials) async {
    try {
      User user = await dataRepository.getUserbyId(credentials.userId);

      if (user == null) {
        user = await dataRepository.createUser(
          userId: credentials.userId,
          email: credentials.email,
        );
      }
      emit(Authenticated(user: user));
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  void signOut() {
    authRespository.signOut();
    emit(Unauthenticated());
  }
}
