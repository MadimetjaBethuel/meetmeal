import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:meetmeal/backend/auth_info/auth_info_cubit.dart';
import 'package:meetmeal/backend/userCubit.dart';
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

  String newGender;
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
                style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _numPicker(),
              _genderPicker(),
              SizedBox(height: 40),
              _createUser(),
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
          itemHeight: 100,
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
    ));
  }

  Widget _createUser() {
    return Center(
      child: RoundedButton(
        text: "Next",
        onPressed: () {
          BlocProvider.of<SaveUserInfoCubit>(context)
              .saveGenderandAge(newGender, currentAge);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SexualPrefernce()),
          );

          print("Success");
        },
      ),
    );
  }
}
