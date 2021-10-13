import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class NumPicker extends StatefulWidget {
  _NumPickerState createState() => _NumPickerState();
}

class _NumPickerState extends State<NumPicker> {
  @override
  Widget build(BuildContext context) {
    int currentValue = 18;
    // TODO: implement build
    return Column(
      children: [
        NumberPicker(
          value: currentValue,
          minValue: 0,
          maxValue: 100,
          step: 10,
          itemHeight: 100,
          axis: Axis.horizontal,
          onChanged: (value) => setState(() => currentValue = value),
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
                final newValue = currentValue - 10;
                currentValue = newValue.clamp(0, 100);
              }),
            ),
            Text('Current horizontal int value: $currentValue'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => setState(() {
                final newValue = currentValue + 20;
                currentValue = newValue.clamp(0, 100);
              }),
            ),
          ],
        ),
      ],
    );
  }
}
