import '../form_submission_status.dart';

class SignUpState {
  final String email;
  bool get isValidEmail => email.contains('@');

  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formStatus;

  SignUpState({
    this.email = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  SignUpState copyWith({
    String username,
    String email,
    String password,
    FormSubmissionStatus formStatus,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
