import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetmeal/backend/Authentication/auth_credentials.dart';

import 'session/session_cubit.dart';

enum AuthState { login, signUp, confirmSignUp, signout }

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit sessionCubit;

  AuthCubit({
    this.sessionCubit,
  }) : super(AuthState.login);

  AuthCredentials credentials;

  void showLogin() => emit(AuthState.login);
  void showsSignUp() => emit(AuthState.signUp);

  void showConfirmSignUp({
    String email,
    String password,
  }) {
    credentials = AuthCredentials(
      email: email,
      password: password,
    );
    emit(AuthState.confirmSignUp);
  }

  void launchSession(AuthCredentials credentials) =>
      sessionCubit.showSession(credentials);
}