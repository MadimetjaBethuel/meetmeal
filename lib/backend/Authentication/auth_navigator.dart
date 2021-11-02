import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetmeal/backend/Authentication/auth_cubit.dart';
import 'package:meetmeal/pages/Registration/confirm_signup.dart';
import 'package:meetmeal/pages/Registration/emailregister.dart';
import 'package:meetmeal/pages/login/login.dart';

class AuthNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Navigator(
        pages: [
          // show login

          if (state == AuthState.login)
            MaterialPage(
              child: LoginScreen(),
            ),
          if (state == AuthState.signUp ||
              state == AuthState.confirmSignUp) ...[
            MaterialPage(
              child: RegisterScreen(),
            ),
            if (state == AuthState.confirmSignUp)
              MaterialPage(child: ConfirmationView())
          ]
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
