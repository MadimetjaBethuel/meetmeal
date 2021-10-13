import 'package:flutter/material.dart';
import 'package:meetmeal/widgets/buttonwidget.dart';

import 'components/numpicker.dart';

class SexualPrefernce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              NumPicker(),
              SizedBox(height: 40),
              Center(
                child: RoundedButton(
                  text: "Women",
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: RoundedButton(
                  text: "Men",
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
