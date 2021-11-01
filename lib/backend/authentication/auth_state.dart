abstract class AuthState {}

class unknownAuthState extends AuthState {}

class Authnticated extends AuthState {
  final String userId;

  Authnticated({this.userId});
}

class Unauthenticated extends AuthState {}
