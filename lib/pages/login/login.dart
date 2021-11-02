import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meetmeal/backend/Authentication/auth_repsository.dart';
import 'package:meetmeal/backend/Authentication/form_submission_status.dart';
import 'package:meetmeal/backend/Authentication/login/login_bloc.dart';
import 'package:meetmeal/backend/Authentication/login/login_event.dart';
import 'package:meetmeal/backend/Authentication/login/login_state.dart';

import 'package:meetmeal/constants/constants.dart';
import 'package:meetmeal/constants/responsive.dart';
import 'package:meetmeal/pages/Registration/emailregister.dart';
import 'package:meetmeal/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
          authRespository: context.read<AuthRepository>(),
        ),
        child: _loginView(context),
      ),
    );
  }

  Widget usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          style: TextStyle(color: kInputTextColor, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: "Email",
            fillColor: kInputColor,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none),
            contentPadding:
                EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            prefix: Padding(
              padding: EdgeInsets.only(right: kDefaultPadding / 4),
            ),
          ),
          validator: (value) =>
              state.isValidemail ? null : "Something Wrong with username",
          onChanged: (value) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(email: value)),
        );
      },
    );
  }

  Widget passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        style: TextStyle(color: kInputTextColor, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          hintText: "Password",
          fillColor: kInputColor,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none),
          contentPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          prefix: Padding(
            padding: EdgeInsets.only(right: kDefaultPadding / 4),
          ),
        ),
        validator: (value) => state.isValidemail ? null : "Password too short",
        onChanged: (value) => context
            .read<LoginBloc>()
            .add(LoginPasswordChanged(password: value)),
      );
    });
  }

  Widget loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? CircularProgressIndicator()
            : CustomButton(
                tap: () {
                  if (_formKey.currentState.validate()) {
                    context.read<LoginBloc>().add(LoginSubmitted());
                  }
                },
                text: 'Login');
      },
    );
  }

  Widget loginImages(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      width: double.infinity,
      height: getScreenPropotionHeight(
          orientation == Orientation.portrait ? 390 : 450, size),
      child: Stack(
        children: [
          Positioned(
              left: getScreenPropotionWidth(64, size),
              top: getScreenPropotionHeight(90, size),
              child: Image.asset(
                'assets/images/heart.png',
                width: getScreenPropotionHeight(67, size),
              )),
          Positioned(
              right: 0,
              child: SvgPicture.asset(
                'assets/images/couple.svg',
                height: getScreenPropotionHeight(390, size),
              )),
          Positioned(
              left: getScreenPropotionWidth(28, size),
              top: getScreenPropotionHeight(190, size),
              child: Text(
                'Login to\na lovely\nlife.',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: kTextColor),
              )),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _loginForm() {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          _showSnackBar(context, formStatus.exception.toString());
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: kDefaultPadding / 3),
            usernameField(),
            SizedBox(height: kDefaultPadding / 2),
            SizedBox(height: kDefaultPadding / 3),
            passwordField(),
            SizedBox(height: kDefaultPadding / 2),
            loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _loginView(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            loginImages(context),
            SizedBox(height: kDefaultPadding),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _loginForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: kAltDarkTextColor,
                        width: size.width / 8,
                        height: 1,
                      ),
                      SizedBox(width: kDefaultPadding / 3),
                      Text('or',
                          style: TextStyle(
                              color: kAltDarkTextColor,
                              fontWeight: FontWeight.w600)),
                      SizedBox(width: kDefaultPadding / 3),
                      Container(
                        color: kAltDarkTextColor,
                        width: size.width / 8,
                        height: 1,
                      ),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  SizedBox(height: kDefaultPadding / 2),
                  Center(
                    child: TextButton(
                      child: Text("Don't have an Accoutn?. Register"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
