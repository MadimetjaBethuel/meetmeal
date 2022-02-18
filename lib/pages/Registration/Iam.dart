import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:meetmeal/backend/Authentication/session/session_cubit.dart';
import 'package:meetmeal/backend/auth_info/auth_info_cubit.dart';
import 'package:meetmeal/pages/Registration/foodpreferencepage.dart';

import 'package:meetmeal/pages/Registration/sexualpreference.dart';
import 'package:meetmeal/widgets/buttonwidget.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:gender_picker/gender_picker.dart';

class Iam extends StatefulWidget {
  _IamState createState() => _IamState();
}

class _IamState extends State<Iam> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SaveUserInfoCubit>(
      create: (context) => SaveUserInfoCubit(),
      child: Body(),
    );
  }
}

class Body extends StatefulWidget {
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  int currentAge = 18;
  Gender startingGender = Gender.Male;
  Gender datingGender = Gender.Male;

  String newGender;
  String dating;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _navBar(),
      body: screenbody(),
    );
  }

  AppBar _navBar() {
    return AppBar(
      title: Text("Select your $currentAge & $startingGender"),
    );
  }

  Widget screenbody() {
    return BlocBuilder<SaveUserInfoCubit, SaveUserInfoState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Container(
            child: Text('I am...',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _numPicker(),
              SizedBox(height: 40),
              _genderPicker(),
              SizedBox(height: 10),
              _screenBody(),
              _createUser(),
              _signOut(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _numPicker() {
    // TODO: implement build
    return Column(
      children: [
        NumberPicker(
          value: currentAge,
          minValue: 18,
          maxValue: 100,
          step: 1,
          itemHeight: 80,
          axis: Axis.horizontal,
          onChanged: (value) => setState(() => currentAge = value),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black26),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => setState(() {
                final newValue = currentAge - 1;
                currentAge = newValue.clamp(0, 80);
              }),
            ),
            Text('Current Age: $currentAge'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => setState(() {
                final newValue = currentAge + 1;
                currentAge = newValue.clamp(0, 80);
              }),
            ),
          ],
        ),
      ],
    );
  }

  Widget _genderPicker() {
    return Center(
        child: GenderPickerWithImage(
      showOtherGender: false,
      verticalAlignedText: false,
      selectedGender: startingGender,
      selectedGenderTextStyle:
          TextStyle(color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
      unSelectedGenderTextStyle:
          TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
      onChanged: (gender) => setState(() => startingGender = gender),
      equallyAligned: true,
      animationDuration: Duration(milliseconds: 300),
      isCircular: true,
      // default : true,
      opacityOfGradient: 0.4,
      padding: const EdgeInsets.all(3),
      size: 70, //default : 40
    ));
  }

  Widget _createUser() {
    return Center(
      child: RoundedButton(
        text: "Next",
        onPressed: () {
          if (startingGender == Gender.Male) {
            newGender = "Male";
          } else if (startingGender == Gender.Female) {
            newGender = "Female";
          }
          if (datingGender == Gender.Male) {
            dating = "Male";
          } else if (startingGender == Gender.Female) {
            dating = "Female";
          }

          BlocProvider.of<SaveUserInfoCubit>(context)
              .saveGenderandAge(newGender, currentAge, dating);

          /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FoodPreferencesPage()),
          );*/

          print("Success");
        },
      ),
    );
  }

  Widget _screenBody() {
    return BlocBuilder<SaveUserInfoCubit, SaveUserInfoState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text('Dating Preference',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _genderPickerdaiting(),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }

  Widget _genderPickerdaiting() {
    return Center(
      child: GenderPickerWithImage(
        showOtherGender: false,
        verticalAlignedText: false,
        selectedGender: datingGender,
        selectedGenderTextStyle:
            TextStyle(color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
        unSelectedGenderTextStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        onChanged: (gender) => setState(() => datingGender = gender),
        equallyAligned: true,
        animationDuration: Duration(milliseconds: 300),
        isCircular: true,
        // default : true,
        opacityOfGradient: 0.4,
        padding: const EdgeInsets.all(3),
        size: 80, //default : 40
      ),
    );
  }

  Widget _signOut() {
    return Center(
      child: RoundedButton(
        text: "SignedOut",
        onPressed: () {
          BlocProvider.of<SessionCubit>(context).signOut();

          print("Signed out");
        },
      ),
    );
  }
}
