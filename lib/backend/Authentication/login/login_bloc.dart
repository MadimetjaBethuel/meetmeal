import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetmeal/backend/Authentication/auth_credentials.dart';
import 'package:meetmeal/backend/Authentication/auth_cubit.dart';
import 'package:meetmeal/backend/Authentication/auth_repsository.dart';

import '../form_submission_status.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRespository;
  final AuthCubit authCubit;
  LoginBloc({
    this.authRespository,
    this.authCubit,
  }) : super(LoginState());
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // Username updated
    if (event is LoginUsernameChanged) {
      yield state.copyWith(email: event.email);

      // Password updated
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Form submitted
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        final userId = await authRespository.login(
          email: state.email,
          password: state.password,
        );
        yield state.copyWith(formStatus: SubmissionSuccess());

        authCubit.launchSession(
          AuthCredentials(email: state.email, userId: userId),
        );
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
