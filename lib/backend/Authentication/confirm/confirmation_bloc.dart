import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_cubit.dart';
import '../auth_repsository.dart';
import '../form_submission_status.dart';
import 'confirmation_state.dart';
import 'confrimation_event.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {
  final AuthRepository authRespository;
  final AuthCubit authCubit;

  ConfirmationBloc({
    this.authRespository,
    this.authCubit,
  }) : super(ConfirmationState());

  @override
  Stream<ConfirmationState> mapEventToState(ConfirmationEvent event) async* {
    // Confirmation code updated
    if (event is ConfirmationCodeChanged) {
      yield state.copyWith(code: event.code);

      // Form submitted
    } else if (event is ConfirmationSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRespository.confirmSignUp(
          email: authCubit.credentials.email,
          confirmationCode: state.code,
        );

        yield state.copyWith(formStatus: SubmissionSuccess());

        final credentials = authCubit.credentials;
        final userId = await authRespository.login(
          email: credentials.email,
          password: credentials.password,
        );
        credentials.userId = userId;
        authCubit.launchSession(credentials);
      } catch (e) {
        print(e);
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
