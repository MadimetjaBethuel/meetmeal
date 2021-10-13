import 'package:flutter/material.dart';
import 'package:meetmeal/widgets/buttonwidget.dart';
import 'components/numpicker.dart';

class Iam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Container(
            child: Text('I am',
                style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NumPicker(),
              SizedBox(height: 40),
              Center(
                child: RoundedButton(
                  text: "Woman",
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: RoundedButton(
                  text: "Man",
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
