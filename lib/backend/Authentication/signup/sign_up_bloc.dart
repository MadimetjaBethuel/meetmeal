import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetmeal/backend/Authentication/signup/sighn_up_event.dart';
import 'package:meetmeal/backend/Authentication/signup/sign_up_state.dart';

import '../auth_cubit.dart';
import '../auth_repsository.dart';
import '../form_submission_status.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepository;
  final AuthCubit authCubit;

  SignUpBloc({this.authRepository, this.authCubit}) : super(SignUpState());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    // Username updated

    // Email updated
    if (event is SignUpEmailChanged) {
      yield state.copyWith(email: event.email);

      // Password updated
    } else if (event is SignUpPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Form submitted
    } else if (event is SignUpSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepository.signUp(
          email: state.email,
          password: state.password,
        );
        yield state.copyWith(formStatus: SubmissionSuccess());

        authCubit.showConfirmSignUp(
          email: state.email,
          password: state.password,
        );
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
