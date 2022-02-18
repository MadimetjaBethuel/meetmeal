import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:meetmeal/backend/Authentication/session/session_cubit.dart';
import 'package:meetmeal/backend/auth_info/auth_info_cubit.dart';
import 'package:meetmeal/pages/Registration/foodpreferencepage.dart';
import 'package:meetmeal/widgets/buttonwidget.dart';

class SexualPrefernce extends StatefulWidget {
  _SexualPreferenceState createState() => _SexualPreferenceState();
}

class _SexualPreferenceState extends State<SexualPrefernce> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SaveUserInfoCubit>(
      create: (context) => SaveUserInfoCubit(),
      child: SexualPreferenceBody(),
    );
  }
}

class SexualPreferenceBody extends StatefulWidget {
  _SexualPreferenceBodyState createState() => _SexualPreferenceBodyState();
}

class _SexualPreferenceBodyState extends State<SexualPreferenceBody> {
  Gender startingGender = Gender.Male;

  String newGender;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _navBar(),
      body: Center(
        child: _screenBody(),
      ),
    );
  }

  AppBar _navBar() {
    return AppBar(
      title: Text("Dating Preference"),
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
              _genderPicker(),
              SizedBox(height: 40),
              _datingPreference(),
              SizedBox(height: 40),
              _signOut(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _genderPicker() {
    return Center(
      child: GenderPickerWithImage(
        showOtherGender: false,
        verticalAlignedText: true,
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
        size: 120, //default : 40
      ),
    );
  }

  Widget _datingPreference() {
    return Center(
      child: RoundedButton(
        text: "Next",
        onPressed: () {
          if (startingGender == Gender.Male) {
            newGender = "Male";
          } else if (startingGender == Gender.Female) {
            newGender = "Female";
          }
          BlocProvider.of<SaveUserInfoCubit>(context)
              .savedatingPrefernce(newGender);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FoodPreferencesPage()),
          );

          print("Success");
        },
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
