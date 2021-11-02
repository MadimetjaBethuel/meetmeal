abstract class LoginEvent {}

class LoginUsernameChanged extends LoginEvent {
  final String email;

  LoginUsernameChanged({this.email});
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged({this.password});
}

class LoginSubmitted extends LoginEvent {}
