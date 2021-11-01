import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meetmeal/backend/authentication/auth_cubit.dart';
import 'package:meetmeal/constants/constants.dart';
import 'package:meetmeal/constants/responsive.dart';
import 'package:meetmeal/pages/Registration/emailregister.dart';
import 'package:meetmeal/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Container(
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
            ),
            SizedBox(height: kDefaultPadding),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: kDefaultPadding / 3),
                  TextField(
                    style: TextStyle(
                        color: kInputTextColor, fontWeight: FontWeight.w600),
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
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  SizedBox(height: kDefaultPadding / 3),
                  TextField(
                    style: TextStyle(
                        color: kInputTextColor, fontWeight: FontWeight.w600),
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
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  CustomButton(
                      tap: () => BlocProvider.of<AuthCubit>(context).signIn(),
                      text: 'Login'),
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
          ]),
        ),
      ),
    );
  }
}
