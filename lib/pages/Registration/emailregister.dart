import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meetmeal/backend/Authentication/auth_cubit.dart';
import 'package:meetmeal/backend/Authentication/auth_repsository.dart';
import 'package:meetmeal/backend/Authentication/form_submission_status.dart';
import 'package:meetmeal/backend/Authentication/signup/sighn_up_event.dart';
import 'package:meetmeal/backend/Authentication/signup/sign_up_bloc.dart';
import 'package:meetmeal/backend/Authentication/signup/sign_up_state.dart';
import 'package:meetmeal/constants/constants.dart';
import 'package:meetmeal/constants/responsive.dart';
import 'package:meetmeal/pages/login/login.dart';
import 'package:meetmeal/widgets/custom_button.dart';

class RegisterScreen extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  RegisterScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpBloc(
          authRepository: context.read<AuthRepository>(),
          authCubit: context.read<AuthCubit>(),
        ),
        child: signUpView(
          context,
        ),
      ),
    );
  }

  Widget _signUpForm() {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          _showSnackBar(context, formStatus.exception.toString());
        }
      },
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            usernameField(),
            SizedBox(height: kDefaultPadding / 2),
            SizedBox(height: kDefaultPadding / 3),
            passwordField(),
            SizedBox(height: kDefaultPadding / 2),
            signButton(),
          ],
        ),
      ),
    );
  }

  Widget usernameField() {
    return BlocBuilder<SignUpBloc, SignUpState>(
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
              state.isValidEmail ? null : "Something wrong with email",
          onChanged: (value) =>
              context.read<SignUpBloc>().add(SignUpEmailChanged(email: value)),
        );
      },
    );
  }

  Widget passwordField() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return TextFormField(
          style: TextStyle(color: kInputTextColor, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: "Password",
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
              state.isValidPassword ? null : 'Password is too short',
          onChanged: (value) => context.read<SignUpBloc>().add(
                SignUpPasswordChanged(password: value),
              ),
        );
      },
    );
  }

  Widget signButton() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? CircularProgressIndicator
            : CustomButton(
                tap: () {
                  if (_formkey.currentState.validate()) {
                    context.read<SignUpBloc>().add(
                          SignUpSubmitted(),
                        );
                  }
                },
                text: 'Sign Up');
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget signUpView(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding * 2),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/welcome.png',
                    width: getScreenPropotionHeight(300, size),
                  )),
              Text(
                "Let's get closer",
                style: TextStyle(color: kLightTextColor, fontSize: 18.0),
              ),
              SizedBox(height: 5),
              Text(
                "The best place to meet your future partner.",
                style: TextStyle(
                    color: kTextColor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              SizedBox(height: kDefaultPadding / 3),
              _signUpForm(),
              SizedBox(height: kDefaultPadding / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: kAltDarkTextColor,
                    width: size.width / 8,
                    height: 1,
                  ),
                  SizedBox(width: kDefaultPadding / 3),
                  TextButton(
                    child: Text('Login'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                  SizedBox(width: kDefaultPadding / 3),
                  Container(
                    color: kAltDarkTextColor,
                    width: size.width / 8,
                    height: 1,
                  ),
                ],
              ),
              SizedBox(height: 2),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: kAltTextColor),
                    children: [
                      TextSpan(
                          text:
                              "By continue to Register, you accept our company’s "),
                      TextSpan(
                        text: 'Term & conditions',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kAltDarkTextColor,
                            decoration: TextDecoration.underline),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy policies.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kAltDarkTextColor,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding / 2),
            ],
          ),
        ),
      ),
    );
  }
}
