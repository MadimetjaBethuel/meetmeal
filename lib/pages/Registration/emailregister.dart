import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetmeal/constants/constants.dart';
import 'package:meetmeal/constants/responsive.dart';
import 'package:meetmeal/pages/login/login.dart';
import 'package:meetmeal/widgets/custom_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
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
                CustomButton(tap: () {}, text: 'Register'),
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
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
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
      ),
    );
  }
}
